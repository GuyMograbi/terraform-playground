const uuid = require('node-uuid');
const redis = require('redis');
let redisClient = null;
const redisDemo = process.env.REDIS_DEMO === 'true';

if (redisDemo) {
 redisClient = redis.createClient({
    url: `redis://${process.env.REDIS_HOST}:${process.env.REDIS_PORT}`
})

redisClient.connect();

redisClient.on('error', function (err) {
    console.log('[REDIS]: ERROR Could not establish a connection with redis. ', err);
  });
  redisClient.on('connect', function (err) {
    console.log('[REDIS]: SUCCESS - Connected to redis successfully');
  });
}
  

exports.handler = async (event, handler) => {
    let value = 'not-redis-demo';
    if (redisDemo) {
        await redisClient.set('foo', 'bar: ' + Date.now());
        value = await redisClient.get('foo');
    }
    return {
        statusCode: 200,
        headers: {
            "content-type": "application/json",
        },
        body: JSON.stringify({event, uuid: uuid(), iteration: 3, redisValue: value})
    }
}