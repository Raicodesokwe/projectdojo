const functions = require("firebase-functions");

const express = require('express')
const path = require("path");
const unirest = require("unirest");

const app = express();
require('dotenv').config()
app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());
app.use(express.urlencoded({
    extended: true,
}));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");
app.get("/", (req, res) => res.render("pages/index"));
const secret=process.env.APCA_API_SECRET_KEY;
const key=process.env.APCA_API_KEY_ID
app.get("/get_account", function (req, resp) {

    var req = unirest('GET', 'https://paper-api.alpaca.markets/v2/account')
        .headers({
            'APCA-API-SECRET-KEY': secret,
            'APCA-API-KEY-ID': key
        })
        .end(function (res) {
            if (res.error) throw new Error(res.error);
            console.log(res.raw_body);
            resp.send(res.raw_body)
        });

});
app.get("/get_assets", function (req, resp) {

    var req = unirest('GET', 'https://paper-api.alpaca.markets/v2/assets')
        .headers({
            'APCA-API-SECRET-KEY': secret,
            'APCA-API-KEY-ID': key
        })
        .end(function (res) {
            if (res.error) throw new Error(res.error);
            console.log(res.raw_body);
            resp.send(res.raw_body)
        });

});
app.get("/buy_stock", function (req, resp) {
    var symbol = req.body.symbol;
    var req = unirest('POST', 'https://paper-api.alpaca.markets/v2/orders')
        .headers({
            'APCA-API-SECRET-KEY': secret,
            'APCA-API-KEY-ID': key,
            'Content-Type': 'text/plain'
        })
        .send("{\r\n\"symbol\": \"" + symbol + "\",\r\n\"qty\": 1,\r\n\"side\": \"buy\",\r\n\"type\": \"market\",\r\n\"time_in_force\": \"day\"\r\n}")
        .end(function (res) {
            if (res.error) throw new Error(res.error);
            console.log(res.raw_body);
            resp.send(res.raw_body)
        });

});
app.get("/stock_info", function (req, resp) {
    var symbol = req.body.symbol
    var req = unirest('GET', 'https://data.alpaca.markets/v1/last/stocks/' + symbol)
        .headers({
            'APCA-API-SECRET-KEY': secret,
            'APCA-API-KEY-ID': key
        })
        .end(function (res) {
            if (res.error) throw new Error(res.error);
            console.log(res.raw_body);
            resp.send(res.raw_body)
        });

});
app.get("/get_positions", function (req, resp) {

    var req = unirest('GET', 'https://paper-api.alpaca.markets/v2/positions')
        .headers({
            'APCA-API-SECRET-KEY': secret,
            'APCA-API-KEY-ID': key
        })
        .end(function (res) {
            if (res.error) throw new Error(res.error);
            console.log(res.raw_body);
            resp.send(res.raw_body)
        });

});
app.get("/sell_position", function (req, resp) {
var symbol="AAPL";
    var req = unirest('DELETE', 'https://paper-api.alpaca.markets/v2/positions/'+symbol)
        .headers({
            'APCA-API-SECRET-KEY': secret,
            'APCA-API-KEY-ID': key
        })
        .end(function (res) {
            if (res.error) throw new Error(res.error);
            console.log(res.raw_body);
            resp.send(res.raw_body)
        });

})
exports.nyap = functions.https.onRequest(app);
