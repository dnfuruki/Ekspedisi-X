module.exports ={
    home(req,res){
        res.render("home",{
            url: 'http://localhost:8000/',
            userName: req.session.username,
        });
    },

    homeCabang(req,res){
        res.render("home-cabang",{
            url: 'http://localhost:8000/',
            userName: req.session.username,
        });
    },

    cekResi(req,res){
        res.render("cek-resi",{
            url: 'http://localhost:8000/',
            userName: req.session.username,
        });
    }

}