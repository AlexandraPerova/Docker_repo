import { test, expect } from '@playwright/test';

test('Тест открытия окна авторизации', async ({ page }) => {
    // Откройте страницу
    await page.goto('https://kion.ru/');
    await page.locator("//button[contains(text(), 'Войти')]").first().click();
    await page.waitForURL(/.*/); // Подождите, пока произойдет смена URL

    // Проверьте, что текущий URL содержит подстроку "test.ru"
    const currentURL = page.url();
    expect(currentURL).toContain('https://login.mts.ru/');
    console.log( 'Тест прошел успешно');
});
