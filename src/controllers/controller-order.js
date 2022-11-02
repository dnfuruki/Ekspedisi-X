const config = require("../configs/database");
const mysql = require("mysql");
const pool = mysql.createPool(config);

pool.on("error", (err) => {
  console.error(err);
});

module.exports = {
  getDataOrder(req, res) {
    // let sql =
    //   "SELECT id_order,tabel_user.nama_user AS nama_user,tabel_user.nama_user AS list_user, table_admin.admin_name AS nama_admin, tabel_ongkir.tujuan AS tujuan, nama_barang, berat,total_harga,status FROM  tabel_order JOIN tabel_user ON tabel_order.id_user = tabel_user.id_user JOIN table_admin ON tabel_order.admin_id = table_admin.admin_id JOIN tabel_ongkir ON tabel_order.id_ongkir = tabel_ongkir.id_ongkir";

    let = sql =
      "SELECT id_order,tabel_user.nama_user AS nama_user,tabel_user.nama_user AS list_user, table_admin.admin_name AS nama_admin, tabel_ongkir.tujuan AS tujuan, nama_barang, berat,total_harga,status,resi FROM tabel_order JOIN tabel_user ON tabel_order.id_user = tabel_user.id_user JOIN table_admin ON tabel_order.admin_id = table_admin.admin_id JOIN tabel_ongkir ON tabel_order.id_ongkir = tabel_ongkir.id_ongkir";
    let query = pool.query(sql, (err, results) => {
      if (err) throw err;

      // console.log(results);
      res.render("order-cabang", { dataOrder: results });
    });

    // let sql2 = "SELECT * FROM tabel_user";
    //   let query2 = pool.query(sql2, (err, results) => {
    //     if(err) throw err;
    //        res.redirect({dataUser: results});
    // });
  },

  getDataOrderBySuper(req, res) {
    let sql =
      "SELECT id_order,tabel_user.nama_user AS nama_user, table_admin.admin_name AS nama_admin, tabel_ongkir.tujuan AS tujuan, nama_barang, berat,total_harga,status FROM  tabel_order JOIN tabel_user ON tabel_order.id_user = tabel_user.id_user JOIN table_admin ON tabel_order.admin_id = table_admin.admin_id JOIN tabel_ongkir ON tabel_order.id_ongkir = tabel_ongkir.id_ongkir";
    let query = pool.query(sql, (err, results) => {
      if (err) throw err;
      res.render("order", { dataOrder: results });
      // return console.log(query);
    });
  },

  getDataUser(req, res) {
    let sql = "SELECT * FROM tabel_user";
    let query = pool.query(sql, (err, results) => {
      if (err) throw err;
      res.render("order", { dataUser: results });
    });
  },

  // Simpan data order
  addDataOrder(req, res) {
    let data = {
      id_user: req.body.nama_user,
      admin_id: req.body.nama_admin,
      id_ongkir: req.body.tujuan,
      nama_barang: req.body.nama_barang,
      berat: req.body.berat,
      total_harga: req.body.berat * 10000,
      status: "pengiriman",
    };
    let sql = "INSERT INTO tabel_order SET ?";
    let query = pool.query(sql, data, (err, results) => {
      if (err) throw err;
      res.redirect("/order-cabang");
    });
  },
  // Update data order
  editDataOrder(req, res) {
    let sql =
      "UPDATE tabel_order SET id_order='" +
      req.body.id_order +
      "', id_user='" +
      req.body.nama_user +
      "',admin_id='" +
      req.body.nama_admin +
      "',id_ongkir='" +
      req.body.tujuan +
      "',nama_barang='" +
      req.body.nama_barang +
      "',berat='" +
      req.body.berat +
      "',total_harga='" +
      req.body.total_harga +
      "',status='" +
      req.body.status +
      "' WHERE id_order=" +
      req.body.id_order;
    let query = pool.query(sql, (err, results) => {
      if (err) throw err;
      res.redirect("/order-cabang");
    });
  },
  // Delete data order
  deleteDataOrder(req, res) {
    let sql =
      "DELETE FROM tabel_order WHERE id_order=" + req.body.id_order + "";
    let query = pool.query(sql, (err, results) => {
      if (err) throw err;
      res.redirect("/order-cabang");
    });
  },
};
