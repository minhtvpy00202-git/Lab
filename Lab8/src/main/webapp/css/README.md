# CSS Theme System cho JSP

## Tổng quan
Hệ thống CSS này cung cấp hai theme chính: Light (sáng) và Dark (tối) cho các trang JSP, với khả năng chuyển đổi động và lưu trữ preference của người dùng.

## Cấu trúc Files

### CSS Files
- `light-theme.css` - Theme sáng (mặc định)
- `dark-theme.css` - Theme tối
- `theme-switcher.css` - Styles cho nút chuyển đổi theme
- `components.css` - CSS cho các component bổ sung

### JavaScript Files
- `theme-switcher.js` - Logic chuyển đổi theme và lưu trữ preference

## Cách sử dụng

### 1. Trong JSP Layout
```jsp
<head>
    <link rel="stylesheet" href="css/theme-switcher.css">
    <link rel="stylesheet" href="css/components.css">
</head>
<body>
    <!-- Nội dung trang -->
    <script src="js/theme-switcher.js"></script>
</body>
```

### 2. CSS Classes chính

#### Layout
- `.container` - Container chính cho nội dung
- `.header-content` - Header wrapper
- `.card` - Card component
- `.card-header` - Card header

#### Typography
- `.text-center` - Căn giữa text
- `.text-muted` - Text màu mờ
- `h1, h2, h3, h4, h5, h6` - Headings với styling nhất quán

#### Buttons
- `.btn` - Button chính
- `.btn-secondary` - Button phụ
- `.btn:hover` - Hover effects

#### Forms
- `.form-group` - Wrapper cho form elements
- `input, textarea, select` - Form controls với styling nhất quán

#### Utilities
- `.mb-1, .mb-2, .mb-3` - Margin bottom
- `.mt-1, .mt-2, .mt-3` - Margin top

### 3. Theme Variables

#### Light Theme
```css
:root {
    --bg-primary: #ffffff;
    --bg-secondary: #f8f9fa;
    --text-primary: #212529;
    --text-secondary: #6c757d;
    --accent: #007bff;
}
```

#### Dark Theme
```css
:root {
    --bg-primary: #1a1a1a;
    --bg-secondary: #2d2d2d;
    --text-primary: #ffffff;
    --text-secondary: #b3b3b3;
    --accent: #4dabf7;
}
```

## Tính năng

### 1. Auto Theme Detection
- Tự động detect system preference (dark/light mode)
- Lưu preference trong localStorage

### 2. Theme Switcher
- Nút chuyển đổi theme ở góc phải màn hình
- Keyboard shortcut: `Ctrl + Shift + T`
- Smooth transition animations

### 3. Responsive Design
- Mobile-first approach
- Breakpoint chính: 768px
- Grid system với flexbox

### 4. Accessibility
- High contrast ratios
- Focus states cho form elements
- Semantic HTML structure

## Customization

### Thêm màu sắc mới
```css
:root {
    --custom-color: #your-color;
}

.custom-element {
    background-color: var(--custom-color);
}
```

### Tạo component mới
```css
.my-component {
    background-color: var(--bg-secondary);
    border: 1px solid var(--border-color);
    color: var(--text-primary);
    /* Sử dụng CSS variables để tự động adapt với theme */
}
```

## Browser Support
- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

## Performance
- CSS variables cho fast theme switching
- Minimal JavaScript footprint
- Optimized for mobile devices

## Troubleshooting

### Theme không load
- Kiểm tra đường dẫn CSS files
- Đảm bảo JavaScript được load sau DOM

### Styles không apply
- Kiểm tra CSS specificity
- Đảm bảo sử dụng đúng CSS classes

### Mobile responsive issues
- Kiểm tra viewport meta tag
- Test trên các device sizes khác nhau