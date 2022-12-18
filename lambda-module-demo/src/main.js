const uuid = require('node-uuid')

exports.handler = async (event, handler) => {
    return {
        statusCode: 200,
        headers: {
            "content-type": "application/json",
        },
        body: JSON.stringify({event, uuid: uuid(), iteration: 3})
    }
}