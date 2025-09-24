<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Form</title>

<style>
:root {
	--brand: #2563eb;
	--line: #d0d7de;
	--bg: #f6f8fa;
}

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial,
		sans-serif;
	background: var(--bg);
}

.container {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 24px;
}

.card {
	width: 100%;
	max-width: 560px;
	background: #fff;
	border-radius: 16px;
	padding: 24px;
	box-shadow: 0 12px 30px rgba(0, 0, 0, .08);
}

h1 {
	margin: 0 0 16px;
	font-size: 22px;
	text-align: center;
}

.form-grid {
	display: grid;
	grid-template-columns: 140px 1fr;
	gap: 14px 16px;
	align-items: center;
}

label {
	color: #111827;
	font-weight: 600;
}

input[type="text"], input[type="date"], input[type="number"], select {
	width: 100%;
	padding: 10px 12px;
	border: 1px solid var(--line);
	border-radius: 10px;
	outline: none;
}

input:focus, select:focus {
	border-color: var(--brand);
	box-shadow: 0 0 0 3px rgba(37, 99, 235, .15);
}

.inline {
	display: flex;
	gap: 16px;
	flex-wrap: wrap;
}

.inline label {
	font-weight: 500;
}

.full {
	grid-column: 1/-1;
}

hr {
	border: none;
	border-top: 1px solid var(--line);
	margin: 8px 0 16px;
}

button {
	width: 100%;
	padding: 12px 16px;
	border: 0;
	border-radius: 12px;
	background: var(--brand);
	color: #fff;
	font-weight: 700;
	cursor: pointer;
}

button:hover {
	filter: brightness(.95);
}
</style>
</head>
<body>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>

	<div class="container">
		<div class="card">
			<h1>Staff Form</h1>

			<c:url value="/save" var="url" />
			<form action="${url}" method="post" class="form-grid">
				<label for="fullname">Name</label> <input id="fullname"
					name="fullname" type="text" placeholder="Enter your full name here"> <label
					for="birthday">Date of birth</label> <input id="birthday"
					name="birthday" type="date"> <label>Gender</label>
				<div class="inline">
					<label><input type="radio" name="gender" value="true">
						Male</label> <label><input type="radio" name="gender"
						value="false"> Female</label>
				</div>

				<label>Hobbies</label>
				<div class="inline">
					<label><input type="checkbox" name="hobbies" value="R">
						Reading</label> <label><input type="checkbox" name="hobbies"
						value="Traveling"> Traveling</label> <label><input
						type="checkbox" name="hobbies" value="M"> Music</label>
				</div>

				<label for="country">Country</label> <select id="country"
					name="country">
					<option value="VN">Việt Nam</option>
					<option value="US">United States</option>
				</select> <label for="salary">Salary</label> <input id="salary" name="salary"
					type="number" placeholder="Numbers only">

				<div class="full">
					<hr>
				</div>
				<div class="full">
					<button type="submit">Submit</button>
				</div>
			</form>
		</div>
	</div>


</body>
</html>