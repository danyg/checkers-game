import Testee from './testee';

test('Testee exists', () => {
	const notThrow = () => new Testee();

	expect(notThrow).not.toThrow();
});
