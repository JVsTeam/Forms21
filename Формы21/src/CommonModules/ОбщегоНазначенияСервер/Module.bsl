Функция ПолучитьТекущегоПользователя() Экспорт

	ТекущийПользовательИБ = ПользователиИнформационнойБазы.ТекущийПользователь();
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Пользователи.Ссылка
		|ИЗ
		|	Справочник.Пользователи КАК Пользователи
		|ГДЕ
		|	Пользователи.УникальныйИдентификатор = &УникальныйИдентификатор";
	
	Запрос.УстановитьПараметр("УникальныйИдентификатор", ТекущийПользовательИБ.УникальныйИдентификатор);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Если ВыборкаДетальныеЗаписи.Следующий() Тогда
		
		Пользователь = ВыборкаДетальныеЗаписи.Ссылка;
		
	Иначе
		
		НовыйПользователь = Справочники.Пользователи.СоздатьЭлемент();
		НовыйПользователь.Наименование = ТекущийПользовательИБ.Имя;
		НовыйПользователь.Заполнить(Неопределено);
		НовыйПользователь.УникальныйИдентификатор = ТекущийПользовательИБ.УникальныйИдентификатор;
		НовыйПользователь.Записать();
		
		Пользователь = НовыйПользователь.Ссылка;
	
	КонецЕсли;

	Возврат Пользователь;
	
КонецФункции // ПолучитьТекущегоПользователя()
