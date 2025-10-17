// Theme Switcher JavaScript
class ThemeSwitcher {
    constructor() {
        this.currentTheme = localStorage.getItem('theme') || 'light';
        this.init();
    }

    init() {
        this.createSwitcher();
        this.loadTheme();
        this.bindEvents();
    }

    createSwitcher() {
        const switcher = document.createElement('div');
        switcher.className = 'theme-switcher';
        switcher.innerHTML = `
            <button class="theme-toggle" id="themeToggle">
                <span class="theme-icon">${this.currentTheme === 'light' ? '🌙' : '☀️'}</span>
                <span class="theme-text">${this.currentTheme === 'light' ? 'Dark' : 'Light'}</span>
            </button>
        `;
        document.body.appendChild(switcher);
    }

    bindEvents() {
        const toggleButton = document.getElementById('themeToggle');
        toggleButton.addEventListener('click', () => this.toggleTheme());
        
        // Keyboard shortcut: Ctrl + Shift + T
        document.addEventListener('keydown', (e) => {
            if (e.ctrlKey && e.shiftKey && e.key === 'T') {
                this.toggleTheme();
            }
        });
    }

    toggleTheme() {
        this.currentTheme = this.currentTheme === 'light' ? 'dark' : 'light';
        this.saveTheme();
        this.loadTheme();
        this.updateSwitcher();
        this.addTransitionClass();
    }

    loadTheme() {
        const contextPath = window.contextPath || '';
        const existingLink = document.getElementById('theme-css');
        if (existingLink) {
            existingLink.href = `${contextPath}/css/${this.currentTheme}-theme.css`;
        } else {
            const link = document.createElement('link');
            link.id = 'theme-css';
            link.rel = 'stylesheet';
            link.href = `${contextPath}/css/${this.currentTheme}-theme.css`;
            document.head.appendChild(link);
        }
    }

    updateSwitcher() {
        const icon = document.querySelector('.theme-icon');
        const text = document.querySelector('.theme-text');
        
        if (icon && text) {
            icon.textContent = this.currentTheme === 'light' ? '🌙' : '☀️';
            text.textContent = this.currentTheme === 'light' ? 'Dark' : 'Light';
        }
    }

    saveTheme() {
        localStorage.setItem('theme', this.currentTheme);
    }

    addTransitionClass() {
        document.body.classList.add('theme-transition');
        setTimeout(() => {
            document.body.classList.remove('theme-transition');
        }, 300);
    }

    // Public method to get current theme
    getCurrentTheme() {
        return this.currentTheme;
    }

    // Public method to set theme programmatically
    setTheme(theme) {
        if (theme === 'light' || theme === 'dark') {
            this.currentTheme = theme;
            this.saveTheme();
            this.loadTheme();
            this.updateSwitcher();
        }
    }
}

// Initialize theme switcher when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.themeSwitcher = new ThemeSwitcher();
});

// Auto-detect system preference if no saved theme
if (!localStorage.getItem('theme')) {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    localStorage.setItem('theme', prefersDark ? 'dark' : 'light');
}

// Listen for system theme changes
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
    if (!localStorage.getItem('theme-manual')) {
        const newTheme = e.matches ? 'dark' : 'light';
        if (window.themeSwitcher) {
            window.themeSwitcher.setTheme(newTheme);
        }
    }
});