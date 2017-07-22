import { BuildSpeedDemoPage } from './app.po';

describe('build-speed-demo App', () => {
  let page: BuildSpeedDemoPage;

  beforeEach(() => {
    page = new BuildSpeedDemoPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app build!');
  });
});
