package control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/news")
public class News extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<>();
		map.put("title", "Chủ tịch nước Lương Cường phát biểu tại Đại hội đồng Liên Hiệp Quốc");
		map.put("content", "Ngày 23.9 (giờ địa phương), tại trụ sở Liên Hiệp Quốc ở New York, Mỹ, Chủ tịch nước Lương Cường đã có bài phát biểu quan trọng tại Phiên thảo luận cấp cao Đại hội đồng Liên Hiệp Quốc khóa 80 với thông điệp xuyên suốt: 'Tôn vinh giá trị của hòa bình, chuyển đổi mạnh mẽ để kiến tạo tương lai bền vững'.\r\n"
				+ "Theo Bộ Ngoại giao, trong bài phát biểu, Chủ tịch nước Lương Cường khẳng định 80 năm qua, Liên Hiệp Quốc luôn là hiện thân của khát vọng chung của nhân loại vì hòa bình, hợp tác và phát triển, dựa trên các giá trị phổ quát về quyền con người, độc lập dân tộc, bình đẳng, dân chủ và tiến bộ xã hội."
				+ "Tuy vậy, thế giới đang đối mặt với những thách thức gay gắt chưa từng có như xung đột, chiến tranh cục bộ, chạy đua vũ trang, sử dụng vũ lực, đe dọa sử dụng vũ lực, cạnh tranh chiến lược nước lớn, chủ nghĩa đơn phương, sự suy giảm mạnh về cam kết chính trị và nguồn lực. \r\n"
				+ "\r\n"
				+ "Theo đó, Chủ tịch nước kêu gọi cộng đồng quốc tế cùng đề cao chủ nghĩa đa phương và hệ thống quốc tế dựa trên luật pháp quốc tế, với Liên Hiệp Quốc là trung tâm.\r\n"
				+ "\r\n"
				+ "Khẳng định hòa bình vừa là mục tiêu, vừa là điều kiện tiên quyết cho xây dựng tương lai ổn định, công bằng, dân chủ và phát triển thịnh vượng, Chủ tịch nước kêu gọi các nước tuân thủ luật pháp quốc tế và Hiến chương Liên Hiệp Quốc, tôn trọng độc lập chủ quyền, toàn vẹn lãnh thổ, không can thiệp vào công việc nội bộ, không sử dụng vũ lực hay đe dọa sử dụng vũ lực, giải quyết các tranh chấp bằng biện pháp hòa bình.\r\n"
				+ "\r\n"
				+ "Đề cao văn hóa hòa bình thông qua xây dựng lòng tin, đoàn kết quốc tế, đối thoại, tôn trọng khác biệt, Chủ tịch nước kêu gọi ngừng bắn, chấm dứt bạo lực, bảo vệ thường dân, tạo điều kiện cho tiếp cận nhân đạo tại các vùng xung đột, đánh giá cao việc nhiều nước công nhận Nhà nước Palestine, kêu gọi hỗ trợ nhân đạo khẩn cấp cho người dân Palestine, đề nghị Mỹ gỡ bỏ các biện pháp cấm vận đối với Cuba và đưa Cuba ra khỏi danh sách tài trợ khủng bố.\r\n"
				+ "\r\n"
				+ "Chủ tịch nước đề cao vai trò của các tổ chức khu vực, trong đó ASEAN giữ vị trí trung tâm ở châu Á - Thái Bình Dương, tích cực xây dựng Cộng đồng ASEAN tự cường, bao trùm, bền vững; thúc đẩy Thỏa thuận ngừng bắn giữa Campuchia - Thái Lan, triển khai Đồng thuận năm điểm về Myanmar, và duy trì hòa bình, ổn định, an ninh, an toàn, tự do hàng hải, hàng không ở Biển Đông trên cơ sở luật pháp quốc tế, Công ước Liên Hiệp Quốc về luật Biển năm 1982.\r\n"
				+ "\r\n"
				+ "Để kiến tạo tương lai bền vững, Chủ tịch nước kêu gọi tiến hành cải tổ các thể chế đa phương quản trị toàn cầu, nhất là Liên Hiệp Quốc và các thể chế tài chính - tiền tệ quốc tế, để thích ứng tốt hơn, bảo đảm công bằng, minh bạch, hoạt động đồng bộ, hiệu quả, hiệu lực hơn, đáp ứng tốt hơn nhu cầu của các quốc gia và của mọi người dân.\r\n"
				+ "\r\n"
				+ "Nhằm tối ưu hóa mô hình phát triển bền vững dựa trên nền tảng chuyển đổi số và chuyển đổi xanh, Chủ tịch nước nhấn mạnh, các quốc gia cần xây dựng chiến lược tổng thể, đầu tư mạnh mẽ vào nghiên cứu phát triển, đào tạo nguồn nhân lực chất lượng cao, phát triển hạ tầng công nghệ xanh, đặc biệt cần tăng cường hợp tác quốc tế trong chuyển giao công nghệ và huy động tài chính xanh, các nước phát triển cần chia sẻ, chuyển giao công nghệ cho các nước đang và chậm phát triển, đồng thời cần bảo đảm quá trình chuyển đổi xã hội phải lấy con người làm trung tâm.\r\n"
				+ "\r\n"
				+ "Chủ tịch nước Lương Cường chia sẻ câu chuyện của một nước Việt Nam hồi sinh từ đổ nát của chiến tranh, từ một nước nghèo nàn, lạc hậu, trình độ thấp, bị bao vậy, cấm vận, nỗ lực vượt bậc trở thành nước đang phát triển, có thu nhập trung bình và hội nhập quốc tế sâu rộng."
				+ "Mặc dù còn những hạn chế cần khắc phục, Chủ tịch nước khẳng định, Việt Nam quyết tâm thực hiện các mục tiêu chiến lược để trở thành nước đang phát triển, có công nghiệp hiện đại, thu nhập trung bình cao vào năm 2030, đến năm 2045 trở thành nước có thu nhập cao; thực hiện các Mục tiêu phát triển bền vững, đạt phát thải ròng bằng \"0\" vào năm 2050 và trở thành một quốc gia hùng cường, hưng thịnh và hạnh phúc.\r\n"
				+ "\r\n"
				+ "Chủ tịch nước Lương Cường khẳng định Việt Nam luôn nỗ lực hết mình và đồng hành cùng tất cả các quốc gia để gánh vác các trọng trách chung, vượt qua thách thức, thúc đẩy chuyển đổi mạnh mẽ để kiến tạo một thế giới hòa bình, ổn định, phát triển thịnh vượng và bền vững, mang lại hạnh phúc, ấm no cho mọi người dân.\r\n"
				+ "\r\n"
				+ "Nhân dịp này, Chủ tịch nước Lương Cường trân trọng mời các quốc gia đến Hà Nội dự Lễ mở ký Công ước Liên Hiệp Quốc về phòng, chống tội phạm mạng vào ngày 25.10 sắp tới, cho biết Việt Nam đang tích cực chuẩn bị để đảm nhiệm vai trò Chủ tịch Hội nghị Kiểm điểm Hiệp ước không phổ biến vũ khí hạt nhân vào năm 2026, đồng thời đề nghị các nước ủng hộ ứng cử của Việt Nam vào Hội đồng Nhân quyền Liên Hiệp Quốc nhiệm kỳ 2026 - 2028 và làm Thẩm phán Tòa án luật Biển quốc tế nhiệm kỳ 2026 - 2036.");
 	req.setAttribute("news", map);
 	req.getRequestDispatcher("/views/news.jsp").forward(req, resp);
	}
	
}
