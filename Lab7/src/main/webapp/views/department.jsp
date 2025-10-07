<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="ftm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department Managerment</title>

<style>
/* Google Fonts */
@import
	url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap')
	;

:root {
	--bg: #0b0f0d;
	--card: #111715;
	--muted: #a6b3ad;
	--text: #e8f3ec;
	--primary: #20c997; /* xanh ngọc */
	--primary-strong: #0fb888;
	--primary-weak: #ccf5e9;
	--danger: #ff6b6b;
	--warning: #f8c147;
	--ring: rgba(32, 201, 151, .35);
	--shadow: 0 10px 25px rgba(0, 0, 0, .35), 0 2px 8px rgba(0, 0, 0, .2);
}

@media ( prefers-color-scheme : light) {
	:root {
		--bg: #f6fbf8;
		--card: #ffffff;
		--muted: #6a7a73;
		--text: #0e1613;
		--ring: rgba(32, 201, 151, .25);
		--shadow: 0 8px 20px rgba(32, 201, 151, .10), 0 2px 8px
			rgba(0, 0, 0, .06);
	}
}

* {
	box-sizing: border-box
}

html, body {
	height: 100%
}

body {
	margin: 0;
	font-family: Inter, system-ui, -apple-system, Segoe UI, Roboto, Arial,
		"Noto Sans", sans-serif;
	background: radial-gradient(1200px 800px at 10% -10%, rgba(32, 201, 151, .06),
		transparent 55%),
		radial-gradient(1000px 900px at 110% 10%, rgba(32, 201, 151, .05),
		transparent 60%), var(--bg);
	color: var(--text);
	line-height: 1.6;
	padding: 32px clamp(16px, 4vw, 48px);
}

/* tiêu đề trang */
title, h1, h2 {
	letter-spacing: .2px
}

h1 {
	margin: 0 0 18px;
	font-size: clamp(22px, 2.2vw, 28px);
	font-weight: 700;
}

/* khung nội dung chính dùng body trực tiếp */
body>* {
	max-width: 1100px;
	margin-inline: auto;
}

/* CARD chung */
form, table {
	background: var(--card);
	border: 1px solid rgba(255, 255, 255, .06);
	border-radius: 18px;
	box-shadow: var(--shadow);
}

/* FORM */
form {
	padding: 22px;
	backdrop-filter: saturate(120%) blur(2px);
	transition: box-shadow .25s ease, transform .25s ease;
}

form:hover {
	transform: translateY(-1px);
	box-shadow: 0 12px 30px rgba(32, 201, 151, .12), var(--shadow);
}

form label {
	font-weight: 600;
	font-size: .95rem;
	color: var(--muted);
}

form input, form textarea {
	width: 100%;
	margin: 8px 0 14px;
	padding: 12px 14px;
	background: linear-gradient(180deg, rgba(255, 255, 255, .02),
		rgba(255, 255, 255, .01));
	border: 1px solid rgba(255, 255, 255, .08);
	border-radius: 12px;
	color: var(--text);
	outline: none;
	transition: border-color .2s ease, box-shadow .2s ease, background .2s
		ease;
}

form textarea {
	resize: vertical;
}

form input:focus, form textarea:focus {
	border-color: var(--primary);
	box-shadow: 0 0 0 6px var(--ring);
}

/* BUTTONS */
form button {
	all: unset;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	padding: 10px 16px;
	margin: 6px 8px 0 0;
	font-weight: 600;
	font-size: .95rem;
	border-radius: 12px;
	cursor: pointer;
	user-select: none;
	border: 1px solid rgba(255, 255, 255, .08);
	background: linear-gradient(180deg, rgba(255, 255, 255, .10),
		rgba(255, 255, 255, 0)), linear-gradient(135deg, var(--primary),
		var(--primary-strong));
	color: #062318;
	transition: transform .12s ease, filter .2s ease, box-shadow .2s ease;
	box-shadow: 0 6px 14px rgba(32, 201, 151, .25);
}

form button:hover {
	transform: translateY(-1px);
	filter: brightness(1.02);
	box-shadow: 0 10px 22px rgba(32, 201, 151, .28);
}

form button:active {
	transform: translateY(0);
}

/* phân loại theo hành động bằng formaction */
form button[formaction$="/delete"] {
	background: linear-gradient(180deg, rgba(255, 255, 255, .08),
		rgba(255, 255, 255, 0)), linear-gradient(135deg, var(--danger),
		#ff3b3b);
	color: #330b0b;
	box-shadow: 0 6px 14px rgba(255, 107, 107, .2);
}

form button[formaction$="/reset"] {
	background: linear-gradient(180deg, rgba(255, 255, 255, .08),
		rgba(255, 255, 255, 0)), linear-gradient(135deg, #adb5bd, #868e96);
	color: #0e0f11;
	box-shadow: 0 6px 14px rgba(173, 181, 189, .2);
}

/* TABLE */
table {
	width: 100%;
	border-collapse: collapse;
	overflow: hidden;
	margin-top: 22px;
}

/* header */
table thead th {
	position: sticky; /* nếu trang dài vẫn dính khi cuộn */
	top: 0;
	z-index: 1;
	text-align: left;
	font-weight: 700;
	letter-spacing: .3px;
	background: linear-gradient(180deg, rgba(255, 255, 255, .06),
		rgba(255, 255, 255, .03)),
		linear-gradient(90deg, rgba(32, 201, 151, .15), rgba(32, 201, 151, 0));
	color: var(--text);
	padding: 14px 16px;
	font-size: .93rem;
	border-bottom: 1px solid rgba(255, 255, 255, .10);
}

table tbody td {
	padding: 14px 16px;
	border-bottom: 1px dashed rgba(255, 255, 255, .08);
	color: var(--text);
	vertical-align: top;
	font-size: .95rem;
}

table tbody tr {
	transition: background .18s ease, transform .18s ease, box-shadow .18s
		ease;
}

table tbody tr:nth-child(odd) {
	background: linear-gradient(180deg, rgba(255, 255, 255, .015),
		rgba(255, 255, 255, 0));
}

table tbody tr:hover {
	background: radial-gradient(600px 120px at 10% 50%, rgba(32, 201, 151, .08),
		transparent 60%);
	transform: translateX(2px);
}

table a {
	color: var(--primary);
	font-weight: 600;
	text-decoration: none;
	padding: 6px 10px;
	border-radius: 10px;
	border: 1px solid rgba(32, 201, 151, .25);
	background: linear-gradient(180deg, rgba(32, 201, 151, .14),
		rgba(32, 201, 151, .07));
	transition: transform .12s ease, box-shadow .2s ease, background .2s
		ease;
}

table a:hover {
	transform: translateY(-1px);
	box-shadow: 0 8px 18px rgba(32, 201, 151, .22);
}

table {
	display: block;
	overflow-x: auto;
}

table thead, table tbody, table tr {
	display: table;
	width: 100%;
	table-layout: fixed;
}

table thead {
	width: 100%;
}

table tbody {
	display: block;
	max-height: 520px;
	overflow: auto;
}

/* FORM layout đẹp hơn trên màn to */
@media ( min-width : 720px) {
	form {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 16px 22px;
		align-items: start;
	}
	form label {
		margin-top: 2px
	}
	form input, form textarea {
		margin-bottom: 0
	}
	form textarea {
		grid-column: 1/-1
	}
	form hr {
		display: none
	}
	form button {
		margin-top: 6px
	}
}

/* MOBILE tối ưu spacing */
@media ( max-width : 719.9px) {
	body {
		padding: 22px 16px;
	}
	form button {
		width: calc(50% - 8px)
	}
}

/* viền focus đẹp cho cả nút và link bằng phím Tab */
:focus-visible {
	outline: 3px solid var(--primary);
	outline-offset: 2px;
}

form input, form textarea{
  border: 1px solid #cbd5e1; /* màu xám nhạt dễ nhìn */
  background: #ffffff;       /* nền trắng rõ hơn */
  color: #1f2937;
}

form input:focus, form textarea:focus{
  border-color: var(--primary); /* xanh lá chủ đạo */
  box-shadow: 0 0 0 4px rgba(32,201,151,.25);
}

</style>

</head>
<body>
	<c:url var="path" value="/department" />
	<!-- FORM -->
	<form method="post">
		<label>Id:</label><br> <input name="id" value="${item.id}"><br>
		<label>Name:</label><br> <input name="name" value="${item.name}"><br>
		<label>Description:</label><br>
		<textarea name="description" rows="3">${item.description}</textarea>
		<hr>
		<button formaction="${path}/create">Create</button>
		<button formaction="${path}/update">Update</button>
		<button formaction="${path}/delete">Delete</button>
		<button formaction="${path}/reset">Reset</button>
	</form>
	<hr>
	<!-- TABLE -->
	<table border="1" style="width: 100%">
		<thead>
			<tr>
				<th>No.</th>
				<th>Id</th>
				<th>Name</th>
				<th>Description</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="d" items="${list}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${d.id}</td>
					<td>${d.name}</td>
					<td>${d.description}</td>
					<td><a href="${path}/edit/${d.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>