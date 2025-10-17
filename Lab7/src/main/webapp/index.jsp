<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lab7 - Management System</title>
<style>
/* Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

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

@media (prefers-color-scheme: light) {
	:root {
		--bg: #f6fbf8;
		--card: #ffffff;
		--muted: #6a7a73;
		--text: #0e1613;
		--ring: rgba(32, 201, 151, .25);
		--shadow: 0 8px 20px rgba(32, 201, 151, .10), 0 2px 8px rgba(0, 0, 0, .06);
	}
}

* {
	box-sizing: border-box;
}

html, body {
	height: 100%;
}

body {
	margin: 0;
	font-family: Inter, system-ui, -apple-system, Segoe UI, Roboto, Arial, "Noto Sans", sans-serif;
	background: radial-gradient(1200px 800px at 10% -10%, rgba(32, 201, 151, .06), transparent 55%),
		radial-gradient(1000px 900px at 110% 10%, rgba(32, 201, 151, .05), transparent 60%), var(--bg);
	color: var(--text);
	line-height: 1.6;
	padding: 32px clamp(16px, 4vw, 48px);
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.container {
	max-width: 600px;
	width: 100%;
	text-align: center;
}

h1 {
	margin: 0 0 32px;
	font-size: clamp(28px, 4vw, 42px);
	font-weight: 700;
	letter-spacing: .2px;
	background: linear-gradient(135deg, var(--primary), var(--primary-strong));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
}

.description {
	margin-bottom: 48px;
	font-size: 1.1rem;
	color: var(--muted);
	line-height: 1.7;
}

.menu-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 24px;
	margin-bottom: 32px;
}

.menu-item {
	background: var(--card);
	border: 1px solid rgba(255, 255, 255, .06);
	border-radius: 18px;
	box-shadow: var(--shadow);
	padding: 32px 24px;
	text-decoration: none;
	color: var(--text);
	transition: transform .25s ease, box-shadow .25s ease, border-color .25s ease;
	backdrop-filter: saturate(120%) blur(2px);
}

.menu-item:hover {
	transform: translateY(-4px);
	box-shadow: 0 16px 40px rgba(32, 201, 151, .15), var(--shadow);
	border-color: rgba(32, 201, 151, .2);
}

.menu-item h2 {
	margin: 0 0 12px;
	font-size: 1.4rem;
	font-weight: 600;
	color: var(--primary);
}

.menu-item p {
	margin: 0;
	color: var(--muted);
	font-size: .95rem;
	line-height: 1.5;
}

.menu-item .icon {
	font-size: 2.5rem;
	margin-bottom: 16px;
	display: block;
}

.footer {
	margin-top: 48px;
	padding-top: 24px;
	border-top: 1px solid rgba(255, 255, 255, .08);
	color: var(--muted);
	font-size: .9rem;
}

/* Responsive */
@media (max-width: 640px) {
	body {
		padding: 24px 16px;
	}
	
	.menu-grid {
		grid-template-columns: 1fr;
		gap: 16px;
	}
	
	.menu-item {
		padding: 24px 20px;
	}
}

/* Focus styles for accessibility */
.menu-item:focus {
	outline: 3px solid var(--primary);
	outline-offset: 2px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>🏢 Lab7 Management System</h1>
		
		<p class="description">
			Chào mừng bạn đến với hệ thống quản lý Lab7. 
			Chọn một trong các module bên dưới để bắt đầu làm việc.
		</p>
		
		<div class="menu-grid">
			<a href="${pageContext.request.contextPath}/department/index" class="menu-item">
				<span class="icon">🏛️</span>
				<h2>Quản lý Phòng ban</h2>
				<p>Thêm, sửa, xóa và xem danh sách các phòng ban trong công ty</p>
			</a>
			
			<a href="${pageContext.request.contextPath}/employee/index" class="menu-item">
				<span class="icon">👥</span>
				<h2>Quản lý Nhân viên</h2>
				<p>Quản lý thông tin nhân viên, phân công phòng ban và cập nhật dữ liệu</p>
			</a>
		</div>
		
		<div class="footer">
			<p>© 2024 Lab7 Management System - Phiên bản 1.0</p>
		</div>
	</div>
</body>
</html>