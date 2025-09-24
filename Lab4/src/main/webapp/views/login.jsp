<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bài 1: Phân Biệt GET và POST</title>
<style>
  :root{
    --bg1:#2a0845;      
    --bg2:#6441a5;      
    --panel:#0f1116;    
    --panel2:#1a1f2a;   
    --stroke:#2b3242;  
    --text:#e8eaed;    
    --muted:#a6adba;    
    --blue1:#1990ff;   
    --blue2:#00a2ff;   
  }

  /* nền */
  body{
    margin:0;
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    background: radial-gradient(1200px 600px at 20% -10%, #8a63ff22, transparent 60%),
                linear-gradient(135deg, var(--bg1), var(--bg2));
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, Arial, sans-serif;
    color:var(--text);
  }

  /* card */
  .login-card{
    width: 360px;
    background:
      linear-gradient(180deg, #ffffff10, #00000000 50%) ,
      linear-gradient(135deg, var(--panel), var(--panel2));
    border:1px solid var(--stroke);
    border-radius:14px;
    box-shadow:
      0 10px 30px rgba(0,0,0,.35),
      inset 0 1px 0 rgba(255,255,255,.04);
    overflow:hidden;
    position:relative;
  }
  /* dải bóng trên card */
  .login-card::before{
    content:"";
    position:absolute; inset:0;
    background: linear-gradient( to bottom, #ffffff22, transparent 40%);
    pointer-events:none;
  }

  .login-head{
    padding:16px 22px;
    background: linear-gradient(135deg, #0b0d12, #161b24);
    border-bottom:1px solid var(--stroke);
    font-weight:700;
    letter-spacing:.08em;
    text-transform:uppercase;
  }

  .login-body{ padding:22px; }

  label{
    display:block;
    font-size:12px;
    letter-spacing:.12em;
    text-transform:uppercase;
    color:var(--muted);
    margin:0 0 8px;
  }

  .field{
    margin-bottom:16px;
  }

  input[type="text"],
  input[type="password"]{
    width:100%;
    height:42px;
    padding:0 12px;
    border-radius:8px;
    border:1px solid var(--stroke);
    background:#0e1320;
    color:var(--text);
    outline:none;
    box-shadow: inset 0 0 0 1px #00000044;
    transition: border-color .2s, box-shadow .2s, background .2s;
  }
  input::placeholder{ color:#8a93a5; }
  input:focus{
    border-color:#2a80ff;
    box-shadow:0 0 0 3px rgba(41,128,255,.25);
    background:#0c1020;
  }

  .actions{
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:12px;
    margin-top:8px;
  }

  .btn{
    appearance:none;
    border:0;
    cursor:pointer;
    padding:10px 18px;
    border-radius:8px;
    font-weight:700;
    color:white;
    background: linear-gradient(180deg, var(--blue2), var(--blue1));
    box-shadow:
      0 6px 14px rgba(0,162,255,.35),
      inset 0 1px 0 rgba(255,255,255,.18);
    transition: transform .06s ease, box-shadow .2s ease, filter .2s ease;
  }
  .btn:hover{ filter:brightness(1.05); }
  .btn:active{ transform: translateY(1px); }

  .remember{
    display:flex;
    align-items:center;
    gap:8px;
    color:var(--muted);
    font-size:14px;
  }
  .message{
    margin-top:14px;
    color:#ffd166;
    font-size:14px;
  }
</style>
</head>
<body>

<div class="login-card">
  <div class="login-head">Sign in</div>
  <div class="login-body">
    <c:url value="/account/login" var="url"/>
    <form action="${url}" method="post" class="login-form">
      <div class="field">
        <label>Username</label>
        <input name="username" type="text" placeholder="Username">
      </div>

      <div class="field">
        <label>Password</label>
        <input name="password" type="password" placeholder="Password">
      </div>

      <div class="actions">
        <label class="remember">
          <input type="checkbox" name="remember" style="accent-color:#2a80ff;">
          Remember me
        </label>
        <button class="btn">Sign in</button>
      </div>
    </form>

    <div class="message">${message}</div>
  </div>
</div>

</body>
</html>
