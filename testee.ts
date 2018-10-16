interface ITestee {
	command(i: number): string;
}

export default class Testee implements ITestee {
	public command(i: number): string {
		throw new Error('Method not implemented.');
	}
}
