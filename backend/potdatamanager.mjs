//Lambda 함수 potdatamanager.mjs -> potdatamanager.handler
import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { 
  DynamoDBDocumentClient, 
  PutCommand, 
  GetCommand, 
  DeleteCommand, 
  UpdateCommand,
  ScanCommand
} from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({ region: "ap-northeast-2" });
const docClient = DynamoDBDocumentClient.from(client);

const tableName = "PotDB";

export const handler = async (event) => {
  let body;
  let statusCode = 200;
  const headers = {
    "Content-Type": "application/json; charset=utf-8",
  };

  try {
    switch (event.routeKey) {
      case "DELETE /items/{ProjectType}/{PotId}":
        await docClient.send(
          new DeleteCommand({
            TableName: tableName,
            Key: {
              ProjectType: event.pathParameters.ProjectType,
              PotId: event.pathParameters.PotId,
            },
          })
        );
        body = `Deleted item with ProjectType ${event.pathParameters.ProjectType} and PotId ${event.pathParameters.PotId}`;
        break;
        
      case "GET /items/{ProjectType}/{PotId}":
        body = await docClient.send(
          new GetCommand({
            TableName: tableName,
            Key: {
              ProjectType: event.pathParameters.ProjectType,
              PotId: event.pathParameters.PotId,
            },
          })
        );
        body = body.Item;
        break;
        
      case "GET /items":
        body = await docClient.send(
          new ScanCommand({
            TableName: tableName,
          })
        );
        body = body.Items;
        break;
        
      case "PUT /items":
        let requestJSON = JSON.parse(event.body);
        await docClient.send(
          new PutCommand({
            TableName: tableName,
            Item: {
              ProjectType: requestJSON.ProjectType,
              PotId: requestJSON.PotId,
              username: requestJSON.username,
              userage: requestJSON.userage,
              projectName: requestJSON.projectName,
              level: requestJSON.level,
              region: requestJSON.region,
              onoffline: requestJSON.onoffline,
              period: requestJSON.period,
              ageRange: requestJSON.ageRange,
              memNum: requestJSON.memNum,
              members: requestJSON.members,
              likeNum: requestJSON.likeNum,
            },
          })
        );
        body = `Put item with ProjectType ${requestJSON.ProjectType} and PotId ${requestJSON.PotId}`;
        break;
        
      case "PATCH /items/{ProjectType}/{PotId}":
        let updateRequestJSON = JSON.parse(event.body);
        await docClient.send(
          new UpdateCommand({
            TableName: tableName,
            Key: {
              ProjectType: event.pathParameters.ProjectType,
              PotId: event.pathParameters.PotId,
            },
            UpdateExpression: "set username = :username, userage = :userage, projectName = :projectName, #lvl = :level, #region = :region, onoffline = :onoffline, period = :period, ageRange = :ageRange, memNum = :memNum, members = :members, likeNum = :likeNum",
            ExpressionAttributeNames: {
              "#lvl": "level",
              "#region": "region"
            },
            ExpressionAttributeValues: {
              ":username": updateRequestJSON.username,
              ":userage": updateRequestJSON.userage,
              ":projectName": updateRequestJSON.projectName,
              ":level": updateRequestJSON.level,
              ":region": updateRequestJSON.region,
              ":onoffline": updateRequestJSON.onoffline,
              ":period": updateRequestJSON.period,
              ":ageRange": updateRequestJSON.ageRange,
              ":memNum": updateRequestJSON.memNum,
              ":members": updateRequestJSON.members,
              ":likeNum": updateRequestJSON.likeNum,
            },
            ReturnValues: "ALL_NEW",
          })
        );
        body = `Updated item with ProjectType ${event.pathParameters.ProjectType} and PotId ${event.pathParameters.PotId}`;
        break;

      default:
        throw new Error(`Unsupported route: "${event.routeKey}"`);
    }
  } catch (err) {
    statusCode = 400;
    body = err.message;
  } finally {
    body = JSON.stringify(body);
  }

  return {
    statusCode,
    body,
    headers,
  };
};
