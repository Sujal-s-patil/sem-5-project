const express = require("express");

const policeRouter = express.Router();
const { policeLogin,policeRegister,getTeamInfo,specific_police} = require("../controllers/police.controller.js")

/* policeRouter.get("/", getPoliceInfos);
policeRouter.get("/:username", getPoliceInfo); */

policeRouter.get("/team",getTeamInfo);
policeRouter.post("/login",policeLogin);
policeRouter.post("/register",policeRegister);
policeRouter.post("/specific",specific_police);


module.exports =  policeRouter;


/* 

  {
    "police_id": "sujal12345",
    "password": "djrajesh",
    "photo": null,
    "aadhar_card": 123456789,
    "full_name": "sujal santosh patil",
    "phone_no": null,
    "email": null,
    "address": null,
    "city": "bhiwandi",
    "state": "maharashra",
    "blood_group": null,
    "post": "bhiwandi",
    "speciality": null,
    "description": null
  }

*/