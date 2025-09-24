<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Máy tính</title>

<style>

body {
	margin: 0;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #f5f7fb;
	font-family: system-ui, "Segoe UI", Roboto, Arial, sans-serif;
}


.calc-card {
	width: 320px;
	background: #fff;
	border: 1px solid #e6e8ef;
	border-radius: 12px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, .06);
	padding: 18px 18px 14px;
}

.title {
	margin: 0 0 12px;
	font-weight: 700;
	font-size: 18px;
	color: #1f2937;
	text-align: center;
}

.field {
	margin-bottom: 10px;
}

.field input {
	width: 95%;
	height: 40px;
	padding: 0 12px;
	border: 1px solid #cfd5e3;
	border-radius: 8px;
	outline: none;
	color: #111827;
	background: #fff;
	transition: border-color .15s, box-shadow .15s;
}

.field input:focus {
	border-color: #4f8cff;
	box-shadow: 0 0 0 3px rgba(79, 140, 255, .2);
}

.actions {
	display: flex;
	gap: 8px;
	margin-top: 6px;
}

.btn {
	flex: 1 1 auto;
	height: 38px;
	border: 0;
	border-radius: 8px;
	cursor: pointer;
	font-weight: 700;
	color: #fff;
	background: #2e7bf7;
	box-shadow: 0 6px 14px rgba(46, 123, 247, .25);
	transition: transform .06s, filter .15s;
}

.btn:hover {
	filter: brightness(1.05);
}

.btn:active {
	transform: translateY(1px);
}

.btn.gray {
	background: #6b7280;
	box-shadow: 0 6px 14px rgba(107, 114, 128, .2);
}

.result {
	margin: 12px 2px 2px;
	font-weight: 600;
	color: #111827;
	text-align: center;
}
</style>

</head>
<body>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>

	<div class="calc-card">
		<h2 class="title">Máy tính cộng trừ</h2>

		<c:url value="/calculate/add" var="addUrl" />
		<c:url value="/calculate/sub" var="subUrl" />

		<form method="post">
			<div class="field">
				<input name="a" type="number" step="any" placeholder="Số a"
					value="${param.a}">
			</div>
			<div class="field">
				<input name="b" type="number" step="any" placeholder="Số b"
					value="${param.b}">
			</div>

			<div class="actions">
				<button class="btn" formaction="${addUrl}" title="Cộng">+</button>
				<button class="btn gray" formaction="${subUrl}" title="Trừ">−</button>
			</div>
		</form>

		<div class="result">${message}</div>
	</div>
</body>
</html>