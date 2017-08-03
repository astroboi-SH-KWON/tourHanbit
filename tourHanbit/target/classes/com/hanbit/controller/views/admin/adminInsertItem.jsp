<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 등록</h2>
<hr>
        
            <div class="row" style="width: 80%;">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	상품 정보 입력
                        </div>
						<form action="adminInsertItem.do" method="post" enctype="multipart/form-data">
							<div class="form-group has-success">
								<label class="control-label" for="inputSuccess">상품 번호</label>
								<input type="text" name="item_key" size="20"><br>
								<label class="control-label" for="inputSuccess">상품 이름</label>
								<input type="text" name="item_name"size="40"><br>
								<label class="control-label" for="inputSuccess">상품 소개글</label>
								<br> <textarea  name="intro_text" cols="100" rows="10"></textarea><br>
								<label class="control-label" for="inputSuccess">상품 가격</label>
								<input type="text" name="price"size="20">원<br>
								<label class="control-label" for="inputSuccess">방문 도시</label>
								<input type="text" name="city"size="40"><br>
							</div>
							<div class="form-group">
								<label class="control-label" for="inputSuccess">이미지1</label>
								<input type="file" name=upload><br>
								<label class="control-label" for="inputSuccess">이미지2</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지3</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지4</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지5</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지6</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지7</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지8</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지9</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지10</label>
								<input type="file" name="upload"><br>
								<label class="control-label" for="inputSuccess">이미지11</label>
								<input type="file" name="upload"><br>
							</div>
							<div class="form-group has-success">
								<h3>스케줄</h3>
								1일차  <br> <textarea  name="day1" cols="100" rows="10"></textarea><br>
								2일차  <br> <textarea  name="day2" cols="100" rows="10"></textarea><br>
								3일차  <br> <textarea  name="day3" cols="100" rows="10"></textarea><br>
								4일차  <br> <textarea  name="day4" cols="100" rows="10"></textarea><br>
								5일차  <br> <textarea  name="day5" cols="100" rows="10"></textarea><br>
								6일차  <br> <textarea  name="day6" cols="100" rows="10"></textarea><br>
								7일차  <br> <textarea  name="day7" cols="100" rows="10"></textarea><br>
								8일차  <br> <textarea  name="day8" cols="100" rows="10"></textarea><br>
								9일차  <br> <textarea  name="day9" cols="100" rows="10"></textarea><br>
								10일차  <br> <textarea  name="day10" cols="100" rows="10"></textarea><br>
								<input type="submit" value="등록" class="btn btn-primary" style="margin-left: 62%;">
							</div>
						</form>
					</div>
				</div>
			</div>
		
	
</body>
</html>