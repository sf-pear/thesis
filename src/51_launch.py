import click
import fiftyone as fo

@click.command()
def launch_51():
    existent_datasets = fo.list_datasets()
    choice = click.prompt(f'What dataset do you want to explore? ({existent_datasets})', default='merged')
    dataset = fo.load_dataset(choice)
    session = fo.launch_app(dataset)
    session.wait()

if __name__ == "__main__":
    launch_51()