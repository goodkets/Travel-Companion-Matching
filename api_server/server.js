const express = require("express")
const app = express()
const prot = 8889
const router = require('./routes/index')
app.use(express.json())
app.use(router)
app.listen(prot, () => {
    console.log(`Example app listening on prot http://127.0.0.1:${prot}`)
})