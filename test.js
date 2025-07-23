const http = require('http');
const assert = require('assert');
const app = require('./server');

app.serve();

http.get(`http://${app.hostname}:${app.port}`, (res) => {
	let data = '';

	res.on('data', (chunk) => {
		data += chunk;
	});

	res.on('end', () => {
		app.close();
		const user = JSON.parse(data)
		assert.strictEqual(user.test, 'passed', 'user didnt pass!');
	});
});

