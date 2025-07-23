const { createServer } = require('node:http');

const hostname = '127.0.0.1';
const port = 3000

const server = createServer((req, res) => {
	res.setHeader('Content-Type', 'application/json');
	res.end(JSON.stringify({name: 'me', test: 'passed'}));
});

app = {port: port, hostname: hostname};

app.serve = function (){
	server.listen(port, hostname, () => {
		console.log(`Server running at http://${hostname}:${port}/`);
	});
}

app.close = function(){
	server.close();
}

module.exports = app;
