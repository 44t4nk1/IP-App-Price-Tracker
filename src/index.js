const express = require('express')
const bodyParser = require("body-parser");
const mongoose = require('mongoose')
require("dotenv").config({path:"../.env"});
// require('./db/mongoose')  
const { MongoClient, ObjectID } = require('mongodb')
const groupRouter = require('./routers/group')
const userRouter = require('./routers/user')
const taskRouter = require('./routers/task')
const budgetRouter = require('./routers/budget')

const PORT = process.env.PORT || 3000;

const app = express()

//connecting to database
const dbURI=process.env.dbURI

const databaseName = "ipprice";

mongoose
  .connect(dbURI, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("Database Connected"))
  .catch((err) => console.log(err));

mongoose.Promise = global.Promise;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());




// Allow CORS
// app.use((req, res, next) => {
//   res.header("Access-Control-Allow-Origin", "*");
//   res.header(
//     "Access-Control-Allow-Headers",
//     "Origin, X-Requested-With, Content-Type, Accept, Authorization"
//   );
//   if (req.method === "OPTIONS") {
//     res.header("Access-Control-Allow-Methods", "PUT, POST, PATCH, DELETE, GET");
//     return res.status(200).json({});
//   }
//   next();
// });



app.use(express.json())
app.use(userRouter)
app.use(taskRouter)
app.use(budgetRouter)
app.use(groupRouter)





app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});