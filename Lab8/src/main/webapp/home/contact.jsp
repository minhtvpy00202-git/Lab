<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<fmt:setBundle basename="i18n.home"/>

<div class="contact-section">
    <h1><fmt:message key="contact.title" /></h1>
    
    <div class="contact-info">
        <div class="card">
            <h3>Thông tin liên hệ</h3>
            <p><strong>Địa chỉ:</strong> 13 P. Trịnh Văn Bô, Xuân Phương, Nam Từ Liêm, Hà Nội</p>
            <p><strong>Điện thoại:</strong> (024) 7300 1955</p>
            <p><strong>Email:</strong> info@fpt.edu.vn</p>
            <p><strong>Website:</strong> www.fpt.edu.vn</p>
        </div>
    </div>
    
    <div class="contact-form">
        <div class="card">
            <h3>Gửi tin nhắn cho chúng tôi</h3>
            <form action="contact" method="post">
                <div class="form-group">
                    <label for="name">Họ và tên:</label>
                    <input type="text" id="name" name="name" required placeholder="Nhập họ và tên của bạn">
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required placeholder="Nhập địa chỉ email">
                </div>
                
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại">
                </div>
                
                <div class="form-group">
                    <label for="subject">Chủ đề:</label>
                    <select id="subject" name="subject" required>
                        <option value="">Chọn chủ đề</option>
                        <option value="admission">Tuyển sinh</option>
                        <option value="program">Chương trình đào tạo</option>
                        <option value="support">Hỗ trợ kỹ thuật</option>
                        <option value="other">Khác</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="message">Tin nhắn:</label>
                    <textarea id="message" name="message" rows="5" required placeholder="Nhập nội dung tin nhắn"></textarea>
                </div>
                
                <div class="form-group text-center">
                    <button type="submit" class="btn">Gửi tin nhắn</button>
                    <button type="reset" class="btn btn-secondary">Làm mới</button>
                </div>
            </form>
        </div>
    </div>
</div>