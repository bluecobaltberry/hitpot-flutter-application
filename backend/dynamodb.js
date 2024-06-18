const { DynamoDBClient } = require('@aws-sdk/client-dynamodb');
const { DynamoDBDocumentClient, PutCommand } = require('@aws-sdk/lib-dynamodb');

// AWS 설정
const client = new DynamoDBClient({ region: 'ap-northeast-2' });
const docClient = DynamoDBDocumentClient.from(client);

async function saveData(data) {
    const params = {
        TableName: 'PotData',
        Item: {
            ProjectType: data.ProjectType,  // 파티션 키
            PotId: data.PotId,              // 정렬 키
            username: data.username,
            userage: data.userage,
            region: data.region,
            period: data.period
        }
    };

    try {
        const result = await docClient.send(new PutCommand(params));
        console.log("Added item:", result);
    } catch (err) {
        console.error("Unable to add item. Error JSON:", JSON.stringify(err, null, 2));
    }
}


// 데이터 가져오기 함수
async function getData(projectType, potId) {
    const params = {
        TableName: 'PotData',
        Key: {
            ProjectType: projectType,  // 파티션 키
            PotId: potId               // 정렬 키
        }
    };

    try {
        const result = await docClient.send(new GetCommand(params));
        console.log("Retrieved item:", result.Item);
        return result.Item;
    } catch (err) {
        console.error("Unable to get item. Error JSON:", JSON.stringify(err, null, 2));
    }
}

// 데이터 업데이트 함수
async function updateData(data) {
    const params = {
        TableName: 'PotData',
        Key: {
            ProjectType: data.ProjectType,  // 파티션 키
            PotId: data.PotId               // 정렬 키
        },
        UpdateExpression: 'set #username = :username, #userage = :userage, #project = :project, #region = :region, #period = :period',
        ExpressionAttributeNames: {
            '#username': 'username',
            '#userage': 'userage',
            '#project': 'project',
            '#region': 'region',
            '#period': 'period'
        },
        ExpressionAttributeValues: {
            ':username': data.username,
            ':userage': data.userage,
            ':project': data.project,
            ':region': data.region,
            ':period': data.period
        }
    };

    try {
        const result = await docClient.send(new UpdateCommand(params));
        console.log("Updated item:", result);
    } catch (err) {
        console.error("Unable to update item. Error JSON:", JSON.stringify(err, null, 2));
    }
}

// 데이터 삭제 함수
async function deleteData(projectType, potId) {
    const params = {
        TableName: 'PotData',
        Key: {
            ProjectType: projectType,  // 파티션 키
            PotId: potId               // 정렬 키
        }
    };

    try {
        const result = await docClient.send(new DeleteCommand(params));
        console.log("Deleted item:", result);
    } catch (err) {
        console.error("Unable to delete item. Error JSON:", JSON.stringify(err, null, 2));
    }
}

// 예제 데이터 저장
const exampleData = {
    ProjectType: 'exampleType',
    PotId: 1,
    username: 'exampleUser',
    userage: 30,
    region: 'exampleRegion',
    period: 'examplePeriod'
};

saveData(exampleData);


// 함수 호출 예제
(async () => {
    await saveData(exampleData);
    const item = await getData('exampleType', 1);
    console.log(item);
    await updateData({ ...exampleData, username: 'updatedUser' });
    await deleteData('exampleType', 1);
})();


// aws dynamodb scan --table-name PotData --region ap-northeast-2
// aws dynamodb get-item --table-name PotData --key '{"ProjectType": {"S": "exampleType"}, "PotId": {"N": "1"}}' --region ap-northeast-2
