'use strict';

exports.hello = function (event, context, callback) {
    var response = {
        statusCode: 200,
        headers: {
            'Content-Type': 'text/html; charset=utf-8',
        },
        body: `Hello ${process.env.mograbious}!`,
    };
    callback(null, response);
};