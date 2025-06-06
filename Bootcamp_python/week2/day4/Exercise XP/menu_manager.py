import psycopg2
from menu_item import MenuItem

# Connect to the database

HOSTNAME = 'localhost'
USERNAME = 'postgres'
PASSWORD = 'shab1991'
DATABASE = 'restaurant'
PORT = "5432"

class MenuManager():
    def __init__(self):
        self.connection = None
        self.cursor = None
    

    @classmethod
    def get_by_name(cls, name):
        """Get a menu item by name."""
        connection = None
        cursor = None
        try:
            connection = psycopg2.connect(host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE)
            cursor = connection.cursor()
            query = "SELECT * FROM menu_item WHERE item_name = %s"
            cursor.execute(query, (name,))
            result = cursor.fetchone()
            if result:
                return MenuItem(result[1], result[2])
            else:
                print(f"No menu item found with item_name: {name}")
                return None
        except Exception as e:
            print(f"Error getting the menu item: {e}")
        finally:
            if cursor:
                cursor.close()
            if connection:
                connection.close()

    @classmethod 
    def all_items(cls):
        """Get all menu items."""
        connection = None
        cursor = None
        try:
            connection = psycopg2.connect(host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE)
            cursor = connection.cursor()
            query = "SELECT * FROM menu_item"
            cursor.execute(query)
            results = cursor.fetchall()
            menu_items = []
            for item in results:
                menu_items.append(MenuItem(item[1], item[2]))
            return menu_items
        except Exception as e:
            print(f"Error getting all menu items: {e}")
        finally:
            if cursor:
                cursor.close()
            if connection:
                connection.close()

if __name__ == "__main__":
    item = MenuItem('Burger', 35)
    item.save()
    item.delete()
    item.update('Veggie Burger', 37)
    item2 = MenuManager.get_by_name('Beef Stew')
    items = MenuManager.all_items()