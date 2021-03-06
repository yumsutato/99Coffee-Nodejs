const config = require('./../database');
const sql = require('mssql');
async function getType(request) {
    try {
        let pool = await sql.connect(config);
        let type = await pool.request()
            .query("SELECT * FROM type");
        return ({
            "status": 200,
            "message": "thành công",
            data: type.recordset
        });
    } catch (error) {
        return ({
            "status": 500,
            "message": error.originalError.info["message"]
        });
    }
}
async function getSale(request) {
    try {
        let pool = await sql.connect(config);
        let sale = await pool.request()
            .query("SELECT * FROM Sales");
        return ({
            "status": 200,
            "message": "thành công",
            data: sale.recordset
        });
    } catch (error) {
        return ({
            "status": 500,
            "message": error.originalError.info["message"]
        });
    }
}
async function getMenu(Type) {
    try {
        let pool = await sql.connect(config);
        let menu = await pool.request()
            .input('id_type', sql.Int, Type)
            .query("SELECT * FROM food_drink WHERE Id_type=@id_type");
        return ({
            "status": 200,
            "message": "thành công",
            data: menu.recordset
        });
    } catch (error) {
        return ({
            "status": 500,
            "message": error.originalError.info["message"]
        });
    }
}
async function getSize() {
    try {
        let pool = await sql.connect(config);
        let size = await pool.request()
            .query("SELECT * FROM size");
        return ({
            "status": 200,
            "message": "thành công",
            data: size.recordset
        });
    } catch (error) {
        return ({
            "status": 500,
            "message": error.originalError.info["message"]
        });
    }
}
async function postBill(Bill) {
    try {
        let pool = await sql.connect(config);
        let bill = await pool.request()
            .input('price', sql.Int, Bill.price)
            .input('dateBill', sql.DateTime, Bill.dateBill)
            .input('id_user', sql.Int, Bill.id_user)
            .query('INSERT INTO bill VALUES (@price,@dateBill,@id_user); SELECT id FROM bill WHERE id_user=@id_user AND price=price AND dateBill=@dateBill');
        return ({
            "status": 200,
            "message": "tạo đơn thành công",
            data: bill.recordset
        });
    } catch (error) {
        console.log(error);
        return ({
            "status": 500,
            "message": "Thất bại"
        });
    }
}

async function billDetail(dt) {
    try {
        let pool = await sql.connect(config);
        for (let i = 0; i < dt.length; i++) {
            await pool.request()
                .input('id_bill', sql.Int, dt[i]['id_bill'])
                .input('id_food_drink', sql.Int, dt[i]['id_food_drink'])
                .input('price', sql.Int, dt[i]['price'])
                .input('id_size', sql.Int, dt[i]['id_size'])
                .input('count', sql.Int, dt[i]['count'])
                .query('INSERT INTO billDetail VALUES (@id_bill,@id_food_drink,@price,@id_size,@count)');
        }
        return ({
            "status": 200,
            "message": "tạo đơn thành công"
        });
    } catch (error) {
        console.log(error);
        return ({
            "status": 500,
            "message": "Thất bại"
        });
    }
}

async function getProSale() {
    try {
        let pool = await sql.connect(config);
        let prosale = await pool.request()
            .query("SELECT * FROM food_drink WHERE promo_price > 0");
        return ({
            "status": 200,
            "message": "thành công",
            data: prosale.recordset
        });
    } catch (error) {
        return ({
            "status": 500,
            "message": error.originalError.info["message"]
        });
    }
}

async function infoIdcart(id_user) {
    try {
        let pool = await sql.connect(config);
        let infoIdcart = await pool.request()
            .input('id_user', sql.Int, id_user)
            .query("SELECT * FROM bill WHERE id_user=@id_user  ORDER BY id ASC");
        return ({
            "status": 200,
            "message": "thành công",
            data: infoIdcart.recordset
        });
    } catch (error) {
        return ({
            "status": 500,
            "message": error.originalError.info["message"]
        });
    }
}
async function infoDetailcart(id_bill) {
    try {
        let pool = await sql.connect(config);
        let infoDetailcart = await pool.request()
            .input('id_bill', sql.Int, id_bill)
            .query("SELECT billDetail.id, billDetail.id_bill, food_drink.name ,billDetail.price,size.nameSize FROM billDetail INNER JOIN size ON size.id = billDetail.id_size INNER JOIN food_drink ON food_drink.id = billDetail.[id_food-drink] WHERE id_bill=@id_bill");
        return ({
            "status": 200,
            "message": "thành công",
            data: infoDetailcart.recordset
        });
    } catch (error) {
        return ({
            "status": 500,
            "message": error.originalError.info["message"]
        });
    }
}
module.exports = {
    getType: getType,
    getSale: getSale,
    getMenu: getMenu,
    getSize: getSize,
    postBill: postBill,
    billDetail: billDetail,
    getProSale: getProSale,
    infoIdcart: infoIdcart,
    infoDetailcart: infoDetailcart,

}