const express = require("express");
const ticketRouter = express.Router();
const { ticketRecords, createTicket ,specificTicket} = require("../controllers/ticket.controller.js")


ticketRouter.get("/get", ticketRecords);
ticketRouter.post("/specific",specificTicket)
ticketRouter.post("/create", createTicket);



module.exports = ticketRouter;



