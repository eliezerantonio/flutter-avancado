/**
 * path :/apimessages
 */


const { Router } = require('express')

const { validateJWT } = require('../middlewares/jwt-validator')

const { getMessages}=require('../controllers/messages_controller')

const router = Router();


router.get("/:de", validateJWT, getMessages);
