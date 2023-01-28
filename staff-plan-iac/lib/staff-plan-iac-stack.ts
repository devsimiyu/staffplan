import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
// import * as sqs from 'aws-cdk-lib/aws-sqs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as apigateway from 'aws-cdk-lib/aws-apigateway';
import * as dotenv from 'dotenv';
import path = require('path');

dotenv.config({path: path.join(__dirname, '../../.env')});

export class StaffPlanIacStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here

    // example resource
    // const queue = new sqs.Queue(this, 'StaffPlanIacQueue', {
    //   visibilityTimeout: cdk.Duration.seconds(300)
    // });
    
    const securityFunc = new lambda.Function(this, 'SecurityFunc', {
      code: lambda.Code.fromAsset(path.join(__dirname, '../../'), {
        bundling: {
          image: cdk.DockerImage.fromRegistry("golang:1.19"),
          command: [
            'bash', '-c',
            ['GOOS=linux GOCACHE="/tmp/.cache" GOPATH="/tmp/.go" go build -o /asset-output/main staff-plan-api/security'].join(' && ')
          ],
          user: '0:0'
        }
      }),
      timeout: cdk.Duration.seconds(45),
      runtime: lambda.Runtime.GO_1_X,
      handler: 'main',
      environment: {
        'DB_USER': process.env['DB_USER']!,
        'DB_PASSWORD': process.env['DB_PASSWORD']!,
        'DB_HOST': process.env['DB_HOST']!,
        'DB_NAME': process.env['DB_NAME']!,
        'DB_PORT': process.env['DB_PORT']!,
        'JWT_SECRET': process.env['JWT_SECRET']!,
        'IS_LAMBDA': 'true'
      }
    });

    const apiGateway = new apigateway.RestApi(this, 'StaffPlanApi');
    const apiResource = apiGateway.root.addResource("api");
    const securityResource = apiResource.addResource("security");
    securityResource.addResource("login").addMethod("POST", new apigateway.LambdaIntegration(securityFunc));
    securityResource.addResource("health").addMethod("ANY", new apigateway.LambdaIntegration(securityFunc));
  }
}
