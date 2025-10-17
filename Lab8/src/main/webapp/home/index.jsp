<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<fmt:setBundle basename="i18n.home"/>

<div class="hero-section">
    <h1><fmt:message key="index.title" /></h1>
    <p class="text-center text-muted mb-3">
        Chào mừng bạn đến với trang web của FPT Polytechnic. 
        Khám phá các khóa học và dịch vụ giáo dục chất lượng cao.
    </p>
    
    <div class="text-center">
        <a href="about" class="btn">Tìm hiểu thêm</a>
        <a href="contact" class="btn btn-secondary">Liên hệ</a>
    </div>
</div>

<div class="features-section mt-3">
    <div class="card">
        <div class="card-header">
            <h3>Đào tạo chất lượng cao</h3>
        </div>
        <p>Chương trình đào tạo hiện đại, phù hợp với nhu cầu thị trường lao động.</p>
    </div>
    
    <div class="card">
        <div class="card-header">
            <h3>Giảng viên kinh nghiệm</h3>
        </div>
        <p>Đội ngũ giảng viên có trình độ cao và nhiều năm kinh nghiệm trong ngành.</p>
    </div>
    
    <div class="card">
        <div class="card-header">
            <h3>Cơ sở vật chất hiện đại</h3>
        </div>
        <p>Trang thiết bị học tập và thực hành được đầu tư đồng bộ và hiện đại.</p>
    </div>
</div>
