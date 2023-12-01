<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <style>
        .modal-content{
            margin: 80px 0px 0px 0px;
            width: 600px;
            height: 750px;
        }

        .modal-header{
        text-align: center;
        font-weight: bold;
        margin: 20px;
       }

       .modal-title{
        text-align: center;
        font-weight: bold;
       }

       .modal-body{
         margin: 20px 60px;
       }

        .emailSend-btn{
            color: #fff;
            background-color: rgb(0, 199, 174);
            border: none;
            width: 100%;
        }

        .sign-up-btn{
            color: #fff;
            background-color: rgb(0, 199, 174);
            border: none;
            width: 100%;
        }

        .btn-man{
            color: #fff;
            background-color: rgb(0, 199, 174);
            border: none;
			width: 200px;
            height: 40px;
			padding: 5px;
            border-radius: 4px;
        }
        
        .btn-woman{
            color: rgb(127, 127, 127);
            background-color: rgb(224, 224, 224);
            border: none;
			width: 200px;
            height: 40px;
			padding: 5px;
            border-radius: 4px;
        }

        .btn-before{
			color: rgb(0, 199, 174);
            background-color: white;
            border: 1px solid rgb(0, 199, 174);
			width: 80px;
			padding: 5px;
		}

		.btn-next{
			color: #fff;
            background-color: rgb(0, 199, 174);
            border: none;
			width: 80px;
			padding: 5px;
		}

        .progress{
			min-width: 100%
		}
        .phone-certification{
            background: rgba(224, 224, 224, 0.5);
            border: none;
            width: 420px;
            height: 40px;
        }
        .pe-pg-bar{
            background-color: rgb(241, 240, 240);
            width: 400px;
            height: 5px;
            margin-top: 5px;
            border-radius: 8px;
            position: relative;
            margin-bottom: 30px;
		}
		.pe-pg-bar-per{
			position: absolute;
			color: rgb(87, 212, 197);
			font-size: 12px;
			right: -25px;
			top: -7px;
		}
		.pe-pg-bar-fill{
			background: rgb(87, 212, 197);
			width: 132px;
			height: 5px;
			position: absolute;
			right: 293px;
			top: 7px;
			border-radius: 8px;
		}
        .modal-align{
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        .pe-info{
            align-items: center;
            justify-content: center;
        }
    </style>

	<title>모달 창 예제</title>
    <!-- 부트스트랩 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	</head>
	
    <div>
        
        <jsp:include page="../common/header.jsp"></jsp:include>
        
        <!-- 부트스트랩 및 jQuery 스크립트 추가 -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        
        
        <div style="margin-top: 55px;">
            <!-- 버튼 클릭 시 모달 열기 -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            회원가입  	
            </button>

            <!-- 첫번째 모달 -->
            <div class="modal" id="myModal" >
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-align">

                            <div class="pe-pg-bar">
                                <div class="pe-pg-bar-per">100%
                                    <div class="pe-pg-bar-fill"></div>
                                </div>
                            </div>

                            <div class="pe-info">
                                <h5 style="text-align: center; font-weight: bold;">마지막으로 필수 정보를 입력해주세요.</h5>
                                    <div>성별</div>
                                    <div style="display: flex; justify-content: space-around;">
                                        <button type="button" class="btn-man">남자</button>
                                        <button type="button" class="btn-woman">여자</button>
                                    </div>

                                    <div>휴대전화 번호 인증</div>
                                    <input class="phone-certification" type="text" placeholder="010-2222-2222 형식으로 입력하시오">

                                    <div>인증번호</div>
                                    <input class="phone-certification" type="text" placeholder="인증번호를 입력하시오">

                                    <form method="get" action="form-action.html">
                                        <div>
                                            전체 동의
                                        </div>
                                    <label><input type="checkbox" name="category" value="agree"> (필수) 이용약관 동의</label>
                                    <label><input type="checkbox" name="category" value="privateAgree"> (필수) 개인정보 수집 및 이용 동의</label>
                                    <label><input type="checkbox" name="category" value="#"> (필수) 14세 이상입니다</label>
                                    </form>
                            </div>

                            <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
                                <button type="submit" class="btn-before">이전</button>
                                <span style="margin-right: 15px;"></span> 
                                <button type="submit" class="btn-next">다음</button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>        


</body>
</html>



