import express from "express";
import path from "path";

const app = express();
const port = 3000;

app.set("view engine", "ejs");app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.get("/", (req, res) => {
  // res.send("Hello, World!");
  res.render("index", { message: "Hello, World!" });
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
