import click
import fiftyone as fo

def _del_print(choice):
    dataset = fo.load_dataset(choice)
    dataset.delete()
    print(f'Dataset {dataset} deleted.')

@click.command()
def delete_51_dataset():
    existent_datasets = fo.list_datasets()
    choice = click.prompt(f'What dataset do you want to delete? ({existent_datasets}, all, none)', default='none')
    if choice == 'none':
        print('No dataset deleted.')
    elif choice == 'all':
        for dataset in existent_datasets:
            _del_print(dataset)
    if choice in existent_datasets:
        _del_print(choice)
    else:
        print(f'Dataset "{choice}" does not exist. Provide a valid dataset name.')

if __name__ == "__main__":
    delete_51_dataset()