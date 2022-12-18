const { handler } = require('./main');

async function main () {
    const result = await handler({name:'my-event'});
    console.log(result);
}
main();