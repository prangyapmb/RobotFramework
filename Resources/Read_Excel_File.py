from RPA.Excel.Files import Files
from RPA.Tables import Tables
from robot.api.deco import keyword


@keyword("Get Orders")
def get_orders(excel, sheet):
    files = Files()
    workbook = files.open_workbook(excel)
    rows = workbook.read_worksheet(sheet, header=True)

    tables = Tables()
    table = tables.create_table(rows)
    tables.filter_empty_rows(table)

    orders = []
    for row in table:
        order = {
            "username": row["uname"],
            "pass": row["password"]
        }
        orders.append(order)

    return orders
