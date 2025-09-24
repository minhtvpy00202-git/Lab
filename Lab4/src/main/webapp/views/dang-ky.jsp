<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký</title>

<style>
body {
	font-family: system-ui, "Segoe UI", Roboto, Arial, sans-serif;
}

.form-card {
	max-width: 520px;
	margin: 28px auto;
	padding: 20px;
	border: 1px solid #e6e8ef;
	border-radius: 12px;
	background: #fff;
}

h2 {
	margin: 0 0 10px;
}

.row {
	display: grid;
	grid-template-columns: 140px 1fr;
	align-items: center;
	gap: 10px;
	margin: 10px 0;
}

.row.align-top {
	align-items: start;
}

.row>label {
	font-weight: 600;
}

input[type="text"], input[type="password"], select, textarea {
	width: 100%;
	padding: 10px 12px;
	border: 1px solid #cfd5e3;
	border-radius: 8px;
	outline: none;
	font: inherit;
}

textarea {
	min-height: 110px;
	resize: vertical;
}

input:focus, select:focus, textarea:focus {
	border-color: #4f8cff;
	box-shadow: 0 0 0 3px rgba(79, 140, 255, .15);
}

.inline-group {
	display: flex;
	gap: 16px;
	flex-wrap: wrap;
}

.actions {
	text-align: right;
	margin-top: 8px;
}

button {
	padding: 10px 16px;
	border: 0;
	border-radius: 8px;
	cursor: pointer;
	background: #2e7bf7;
	color: #fff;
	font-weight: 600;
}

hr {
	border: 0;
	border-top: 1px solid #eceff5;
	margin: 12px 0;
}
</style>


</head>
<body>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<c:set var="form" value="${dangky}" />
<c:url value="/dangky" var="action"/>

	<div class="form-card">
		<h2>
			<strong>Đăng ký</strong>
		</h2>
		<hr>
		
		<form action="${action}" method="post">
		
		<div class="row">
			<label for="username">Tên đăng nhập:</label> <input id="username"
				name="username" type="text" placeholder="Nhập username vào đây" value="${form.username}"/>
		</div>


		<div class="row">
			<label for="password">Mật khẩu:</label> <input id="password"
				name="password" type="password" placeholder="Nhập password vào đây" value="${form.password }"/>
		</div>


		<div class="row">
			<label>Giới tính:</label>
			<div class="inline-group">
				<label><input type="radio" name="gender" value="male"
					<c:if test="${form.gender eq 'male'}">checked</c:if> /> Nam</label> 
				<label><input type="radio" name="gender"
					value="female" <c:if test="${form.gender eq 'female'}">checked</c:if> /> Nữ</label>
			</div>
		</div>


		<div class="row">
			<label> </label> <label><input type="checkbox" name="marital" value="true"
				<c:if test="${form.marital eq 'true'}">checked</c:if>
				/> Đã có gia đình?</label>
		</div>


		<div class="row">
			<label for="country">Quốc tịch:</label> <select id="country"
				name="country">
				<option value="VN" <c:if test="${form.country eq 'VN'}">selected</c:if>>Việt Nam</option>
				<option value="US" <c:if test="${form.country eq 'US'}">selected</c:if>  >United States</option>
				<option value="CN" <c:if test="${form.country eq 'CN'}">selected</c:if>  >China</option>
			</select>
		</div>


		<div class="row">
			<label>Sở thích:</label>
			<div class="inline-group">
				<label><input type="checkbox" name="hobby" value="read" <c:if test="${fn:contains(fn:join(form.hobby, ','), 'read') }">checked</c:if> >
					Đọc sách</label>
				<label><input type="checkbox" name="hobby"
					value="travel" <c:if test="${fn:contains(fn:join(form.hobby, ','), 'travel')}">checked</c:if> > Du lịch</label>
				<label><input
					type="checkbox" name="hobby" value="music" <c:if test="${fn:contains(fn:join(form.hobby, ','), 'music')}">checked</c:if> > Âm nhạc</label>
				<label><input
					type="checkbox" name="hobby" value="other" <c:if test="${fn:contains(fn:join(form.hobby, ','), 'other') }">checked</c:if> > Khác</label>
			</div>
		</div>


		<div class="row align-top">
			<label for="note">Ghi chú:</label>
			<textarea id="note" name="note" placeholder="Thông tin thêm...">${form.note }</textarea>
		</div>

		<hr>
		<div class="actions">
			<button name="submit">Đăng ký</button>
		</div>
		</form>
		<div class="msg">${message}</div>
	</div>
</body>
</html>