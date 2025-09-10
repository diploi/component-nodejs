import { createServer } from "node:http";
import { readFile } from "node:fs";
import { join } from "node:path";

const server = createServer((req, res) => {
  const filePath = join(process.cwd(), "src", "index.html");
  readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(500, { "Content-Type": "text/plain" });
      res.end("Error loading HTML file");
      return;
    }
    res.writeHead(200, { "Content-Type": "text/html" });
    res.end(data);
  });
});

const port = process.env.PORT;
const host = process.env.HOSTNAME;

// Starts a simple HTTP server
server.listen(port, host, () => {
  console.log(`Listening on ${host}:${port}`);
});
