# Reeleezee API

With this module you will be able to access and manage your [Reeleezee] account via API

## Credentials

You need to place your credentials in your `Coldbox.cfc` file like this:

```
reeleezee = {
	username = "###########",
	password = "###########",
	url = "https://portal.reeleezee.nl/api/v1/"
}
```

## Retrieve objects

Once it's configured you can access everything in your Reeleezee account in this way:

```reeleezee.domain.invoice.Invoice``` For invoices
```reeleezee.domain.customer``` For customers

etc.

## Example of use:

```
property name="profitandlossesservice" inject="models.reeleezee.interface.profitandlosses.Profitandlossesservice";
...
prc.profitandlosses = Profitandlossesservice.getProfitAndLossesForYear(year=prc.year);
```

   [Reeleezee]: <https://www.reeleezee.nl/>
