// dynamodb_start.js
var AWS = require('aws-sdk')

// AWS 설정
AWS.config.update({
    //accessKeyId: 'YOUR_ACCESS_KEY_ID',
    //secretAccessKey: 'YOUR_SECRET_ACCESS_KEY',
    region: 'ap-northeast-2',
    //endpoint: "http://dynamodb.ap-northeast-2.amazonaws.com"
})

// DocumentClient 인스턴스 생성
const dynamodb = new AWS.DynamoDB.DocumentClient();

function saveData(data) {
    var params = {
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
    /*
    try {
        const result = await dynamodb.put(params).promise();
        console.log("Added item:", result);
    } catch (err) {
        console.error("Unable to add item. Error JSON:", JSON.stringify(err, null, 2));
    }
    */
    
    dynamodb.put(params, function(err, data) {
        if (err) {
            console.error("Unable to add item. Error JSON:", JSON.stringify(err, null, 2));
        } else {
            console.log("Added item:", JSON.stringify(data, null, 2));
        }
    });
}

// 예제 데이터 저장
var exampleData = {
    ProjectType: 'exampleType',
    PotId: 1,
    username: 'exampleUser',
    userage: 30,
    region: 'exampleRegion',
    period: 'examplePeriod'
};

saveData(exampleData);