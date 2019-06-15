var vm = new Vue({
    el:'#rrapp',
    data:{
        username: '',
        password: '',
        captcha: '',
        error: false,
        errorMsg: '',
        src: 'captcha.jpg',
        img: {
            normal: "/statics/img/login/normal.png",
            blindfold: '/statics/img/login/blindfold.png',
            greeting: '/statics/img/login/greeting.png'
        },
        bear: "/statics/img/login/normal.png",
    },
    beforeCreate: function(){
        if(self != top){
            top.location.href = self.location.href;
        }
    },
    methods: {
        refreshCode: function(){
            this.src = "captcha.jpg?t=" + $.now();
        },
        blank() {
            console.log("blank");
            vm.error = false;
            vm.bear = vm.img.blindfold;
        },
        /*greeting() {
            console.log("greeting");
            vm.error = false;
            vm.bear = vm.img.greeting;
        },
        blindfold() {
            console.log("blindfold");
            vm.error = false;
            vm.bear = vm.img.blindfold;
        },*/
        clearError() {
            vm.error = false;
        },
        login: function (event) {
            if(!vm.username){
                vm.error = true;
                vm.errorMsg = "请输入账号";
                return ;
            }
            if(!vm.password){
                vm.error = true;
                vm.errorMsg = "请输入密码";
                return ;
            }
            if(!vm.captcha){
                vm.error = true;
                vm.errorMsg = "请输入图片验证码";
                return ;
            }
            var data = "username="+vm.username+"&password="+vm.password+"&captcha="+vm.captcha;
            $.ajax({
                type: "POST",
                url: "sys/login",
                data: data,
                dataType: "json",
                success: function(result){
                    if(result.code == 0){//登录成功
                        parent.location.href ='index.html';
                    } else {
                        vm.error = true;
                        vm.errorMsg = result.msg;
                        vm.refreshCode();
                    }
                }
            });
        }
    }
});