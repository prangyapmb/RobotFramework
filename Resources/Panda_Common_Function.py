@keyword("Panda CommonFunction")
def read_webtable_using_panda(webtable_value, colname):
    df = pd.read_html(webtable_value)
    print(df)
    df = df[-1]
    df.to_csv('table.csv')
    data = pd.read_csv("table.csv")
    # Converting a specific Dataframe
    # column to list using Series.tolist()
    col_list = data[colname].tolist()
    return col_list
