var express = require("express");
const cors = require("cors");
var app = express();
const fs = require("fs");

app.use(cors());

app.use("/contracts", express.static("build/contracts"));
app.all("/list", (req, res) => {
  const files = fs
    .readdirSync("./build/contracts")
    .map((f) => f.split(".")[0])
    .filter((name) => {
      const j = JSON.parse(fs.readFileSync(`./build/contracts/${name}.json`));
      if (j.deployedBytecode == "0x" || Object.keys(j.networks).length === 0) {
        return false;
      } else {
        return true;
      }
    });

  res.json(files);
});

app.listen(5000);
