const db = require("./sql");
const bcrypt = require('bcrypt');

const policeRegister = async (req, res) => {
    const data = req.body;
    const password = data.password;
    const keys = Object.keys(data);
    const values = Object.values(data);
    values.pop();
    values.push(bcrypt.hashSync(password, 10));
    const placeholders = keys.map(() => '?').join(',');

    db.query(`SELECT * FROM police WHERE police_id= ?`, [data.police_id], (error, results) => {
        if (results.length === 0) {
            const query = `INSERT INTO police (${keys.join(',')}) VALUES (${placeholders})`;
            db.query(query, values, (error, results) => {
                if (error) {
                    console.error(error);
                    return res.status(500).json({ error: "Error occurred while inserting user" });
                } else {
                    res.json({ message: "success" })
                }
            })
        } else {
            res.json({ message: 'user already exist' });
        }
    })
}


const policeLogin = async (req, res) => {
    const data = req.body;
    db.query(`select * from police where police_id=?`, [data.police_id], (error, results) => {
        if (results.length === 0) {
            res.json({ message: "id does not exist" })
        } else {
            const password = results[0].password;
            if (bcrypt.compareSync(data.password, password)) {
                results = { ...results, "message": "Login successful" };
                res.json(results);
            } else {
                res.json({ message: "incorrect password" });
            }
        }
    })
}
const getTeamInfo = async (req, res) => {
    db.query(`select * from police`, (error, results) => {
        if (error) {
            res.json({ error: error, message: 'something went wrong' })
        } else {
            res.json(results);
        }
    })
}

const specific_police = async (req, res) => {
    const data = req.body;
    const keys = Object.keys(data);
    const values = Object.values(data);
    const placeholders = keys.map((key) => `${key} = ?`).join(' AND ');
    const query = `SELECT * FROM police WHERE ${placeholders} ;`;
    db.query(query, values, (error, results) => {
        if (error) {
            res.json({ error: error })
        } else {
            res.json(results);
        }
    })
}

module.exports = {
    policeRegister,
    policeLogin,
    getTeamInfo,
    specific_police
};


