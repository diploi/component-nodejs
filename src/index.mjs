import { createServer } from 'node:http';

const server = createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello World!\n');
});

const port = process.env.PORT;
const host = process.env.HOSTNAME;

// Starts a simple HTTP server
server.listen(port, host, () => {
  console.log(`Listening on ${host}:${port}`);
});
