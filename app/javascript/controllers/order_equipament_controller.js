import { Autocomplete } from 'stimulus-autocomplete';

class OrderEquipamentController extends Autocomplete{
  static targets = ["periodStart", "periodEnd"];

  buildURL(query){
    const periodStartValue = this.periodStartTarget.value;
    const periodEndValue = this.periodEndTarget.value;
    const urlBase = new URL(this.urlValue, window.location.href).toString();
    return `${urlBase}?q=${query}&period_start=${periodStartValue}&period_end=${periodEndValue}`;
  }
}

export default OrderEquipamentController;