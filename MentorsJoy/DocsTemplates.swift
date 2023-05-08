//
//  DocsTemplates.swift
//  MentorsJoy
//

import Foundation

// MARK: - ОБЩИЕ РАЗДЕЛЫ
class DocsCommon {
    let gost = [
        "ГОСТ 15150-69 Машины, приборы и другие технические изделия. Исполнения для различных климатических районов. Категории, условия эксплуатации, хранения и транспортирования в части воздействия климатических факторов внешней среды. – М.: Изд-во стандартов, 1997.",
        
        "ГОСТ 19.101-77 Виды программ и программных документов. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.102-77 Стадии разработки. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.103-77 Обозначения программ и программных документов. //Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.104-78 Основные надписи. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.105-78 Общие требования к программным документам. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.201-78 Техническое задание. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.301-79 Программа и методика испытаний. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.401-78 Текст программы. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.404-79 Пояснительная записка. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.505-79 Руководство оператора. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.602-78 Правила дублирования, учета и хранения программных документов, выполненных печатным способом. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.603-78 Общие правила внесения изменений. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.604-78 Правила внесения изменений в программные документы, выполненные печатным способом. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001."
    ]
}

// MARK: - ТЕХНИЧЕСКОЕ ЗАДАНИЕ
final class DocsTask: DocsCommon {
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC") -> String {
        return "\tТехническое задание – это основной документ, оговаривающий набор требований и порядок создания программного продукта, в соответствии с которым производится разработка программы, ее тестирование и приемка.\n" +
        "\tНастоящее Техническое задание на разработку программы «\(projectTopic)» содержит следующие разделы: «Введение», «Основания для разработки», «Назначение разработки», «Требования к программе», «Требования к программной документации», «Технико-экономические показатели», «Стадии и этапы разработки», «Порядок контроля и приемки» и список использованной литературы.\n" +
        "\tВ разделе «Введение» указано наименование и краткая характеристика области применения программы «\(projectTopic)».\n" +
        "\tВ разделе «Основания для разработки» указан документ, на основании которого ведется разработка и наименование темы разработки.\n" +
        "\tВ разделе «Назначение разработки» указано функциональное и эксплуатационное назначение программного продукта.\n" +
        "\tРаздел «Требования к программе» содержит основные требования к функциональным характеристикам, к интерфейсу программы, к надежности, к условиям эксплуатации, к составу и параметрам технических средств, к информационной и программной совместимости, к маркировке и упаковке, к транспортировке и хранению.\n" +
        "\tРаздел «Требования к программной документации» содержит предварительный состав программной документации и специальные требования к ней.\n" +
        "\tРаздел «Технико-экономические показатели» содержит ориентировочную экономическую эффективность, предполагаемую годовую потребность, экономические преимущества разработки программы «\(projectTopic)».\n" +
        "\tРаздел «Стадии и этапы разработки» содержит этапы, содержание и сроки работ.\n" +
        "\tВ разделе «Порядок контроля и приемки» указаны общие требования к приемке работы.\n" +
        "\tНастоящий документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 [2] Виды программ и программных документов.\n" +
        "\t2.\tГОСТ 19.102-77 [3] Стадии разработки.\n" +
        "\t3.\tГОСТ 19.103-77 [4] Обозначения программ и программных документов.\n" +
        "\t4.\tГОСТ 19.104-78 [5] Основные надписи.\n" +
        "\t5.\tГОСТ 19.105-78 [6] Общие требования к программным документам.\n" +
        "\t6.\tГОСТ 19.106-78 [7] Требования к программным документам, выполненным печатным способом.\n" +
        "\t7.\tГОСТ 19.201-78 [8] Техническое задание. Требования к содержанию и оформлению.\n" +
        "\tИзменения к Техническому заданию оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78[15]."
    }
}

// MARK: - ПОЯСНИТЕЛЬНАЯ ЗАПИСКА
class DocsNote: DocsCommon {
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC", _ projectName: String = "PROJECT NAME", _ shortDescription : String = "") -> String {
        return "\tДанный программный документ представляет собой пояснительную записку к программному проекту «\(projectTopic)», предназначенному для реализации внутренней логики мобильного приложения «\(projectName)», которое будет использоваться студентами. \(shortDescription))\n" +
        "\tВ разделе «Введение» содержится наименование программы, условное обозначение темы разработки, документ, на основании которого ведётся разработка, а также организация, утвердившая данный документ.\n" +
        "\tВ разделе «Назначение и область применения» указано функциональное и эксплуатационное назначение программы и краткая характеристика области её применения.\n" +
        "\tВ разделе «Технические характеристики» содержатся следующие подразделы: постановка задачи на разработку программы, описание функционирования программы, описание алгоритма работы программы, описание и обоснование выбора метода организации входных и выходных данных, описание и обоснование выбора состава технических и программных средств.\n" +
        "\tВ разделе «Ожидаемые технико-экономические показатели» указана предполагаемая потребность и экономические преимущества разработки по сравнению с отечественными и зарубежными образцами или аналогами.\n" +
        "\tПрограммный документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 Виды программ и программных документов [2];\n" +
        "\t2.\tГОСТ 19.102-77 Стадии разработки[3];\n" +
        "\t3.\tГОСТ 19.103-77 Обозначения программ и программных документов[4];\n" +
        "\t4.\tГОСТ 19.104-78 Основные надписи[5];\n" +
        "\t5.\tГОСТ 19.105-78 Общие требования к программным документам[6];\n" +
        "\t6.\tГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом [7];\n" +
        "\t7.\t ГОСТ19.404-79 Пояснительная записка. Требования к содержанию и оформлению[11].\n" +
        "\tИзменения к Пояснительной записке оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78 [15]."
    }
}

// MARK: - ПРОГРАММА И МЕТОДИКА ИСПЫТАНИЙ
class DocsTesting: DocsCommon {
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC") -> String {
        return "\tТехническое задание – это основной документ, оговаривающий набор требований и порядок создания программного продукта, в соответствии с которым производится разработка программы, ее тестирование и приемка.\n" +
        "\tНастоящее Техническое задание на разработку программы «\(projectTopic)» содержит следующие разделы: «Введение», «Основания для разработки», «Назначение разработки», «Требования к программе», «Требования к программной документации», «Технико-экономические показатели», «Стадии и этапы разработки», «Порядок контроля и приемки» и список использованной литературы.\n" +
        "\tВ разделе «Введение» указано наименование и краткая характеристика области применения программы «\(projectTopic)».\n" +
        "\tВ разделе «Основания для разработки» указан документ, на основании которого ведется разработка и наименование темы разработки.\n" +
        "\tВ разделе «Назначение разработки» указано функциональное и эксплуатационное назначение программного продукта.\n" +
        "\tРаздел «Требования к программе» содержит основные требования к функциональным характеристикам, к интерфейсу программы, к надежности, к условиям эксплуатации, к составу и параметрам технических средств, к информационной и программной совместимости, к маркировке и упаковке, к транспортировке и хранению.\n" +
        "\tРаздел «Требования к программной документации» содержит предварительный состав программной документации и специальные требования к ней.\n" +
        "\tРаздел «Технико-экономические показатели» содержит ориентировочную экономическую эффективность, предполагаемую годовую потребность, экономические преимущества разработки программы «\(projectTopic)».\n" +
        "\tРаздел «Стадии и этапы разработки» содержит этапы, содержание и сроки работ.\n" +
        "\tВ разделе «Порядок контроля и приемки» указаны общие требования к приемке работы.\n" +
        "\tНастоящий документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 [2] Виды программ и программных документов.\n" +
        "\t2.\tГОСТ 19.102-77 [3] Стадии разработки.\n" +
        "\t3.\tГОСТ 19.103-77 [4] Обозначения программ и программных документов.\n" +
        "\t4.\tГОСТ 19.104-78 [5] Основные надписи.\n" +
        "\t5.\tГОСТ 19.105-78 [6] Общие требования к программным документам.\n" +
        "\t6.\tГОСТ 19.106-78 [7] Требования к программным документам, выполненным печатным способом.\n" +
        "\t7.\tГОСТ  [] \n" +
        "\tИзменения к  оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78[15]."
    }
}

// MARK: - РУКОВОДСТВО ОПЕРАТОРА
class DocsManual: DocsCommon {
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC") -> String {
        return "\tТехническое задание – это основной документ, оговаривающий набор требований и порядок создания программного продукта, в соответствии с которым производится разработка программы, ее тестирование и приемка.\n" +
        "\tНастоящее Техническое задание на разработку программы «\(projectTopic)» содержит следующие разделы: «Введение», «Основания для разработки», «Назначение разработки», «Требования к программе», «Требования к программной документации», «Технико-экономические показатели», «Стадии и этапы разработки», «Порядок контроля и приемки» и список использованной литературы.\n" +
        "\tВ разделе «Введение» указано наименование и краткая характеристика области применения программы «\(projectTopic)».\n" +
        "\tВ разделе «Основания для разработки» указан документ, на основании которого ведется разработка и наименование темы разработки.\n" +
        "\tВ разделе «Назначение разработки» указано функциональное и эксплуатационное назначение программного продукта.\n" +
        "\tРаздел «Требования к программе» содержит основные требования к функциональным характеристикам, к интерфейсу программы, к надежности, к условиям эксплуатации, к составу и параметрам технических средств, к информационной и программной совместимости, к маркировке и упаковке, к транспортировке и хранению.\n" +
        "\tРаздел «Требования к программной документации» содержит предварительный состав программной документации и специальные требования к ней.\n" +
        "\tРаздел «Технико-экономические показатели» содержит ориентировочную экономическую эффективность, предполагаемую годовую потребность, экономические преимущества разработки программы «\(projectTopic)».\n" +
        "\tРаздел «Стадии и этапы разработки» содержит этапы, содержание и сроки работ.\n" +
        "\tВ разделе «Порядок контроля и приемки» указаны общие требования к приемке работы.\n" +
        "\tНастоящий документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 [2] Виды программ и программных документов.\n" +
        "\t2.\tГОСТ 19.102-77 [3] Стадии разработки.\n" +
        "\t3.\tГОСТ 19.103-77 [4] Обозначения программ и программных документов.\n" +
        "\t4.\tГОСТ 19.104-78 [5] Основные надписи.\n" +
        "\t5.\tГОСТ 19.105-78 [6] Общие требования к программным документам.\n" +
        "\t6.\tГОСТ 19.106-78 [7] Требования к программным документам, выполненным печатным способом.\n" +
        "\t7.\tГОСТ  [] \n" +
        "\tИзменения к  оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78[15]."
    }
}

// MARK: - ТЕКСТ ПРОГРАММЫ
class DocsProgramm: DocsCommon {
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC") -> String {
        return "\tТехническое задание – это основной документ, оговаривающий набор требований и порядок создания программного продукта, в соответствии с которым производится разработка программы, ее тестирование и приемка.\n" +
        "\tНастоящее Техническое задание на разработку программы «\(projectTopic)» содержит следующие разделы: «Введение», «Основания для разработки», «Назначение разработки», «Требования к программе», «Требования к программной документации», «Технико-экономические показатели», «Стадии и этапы разработки», «Порядок контроля и приемки» и список использованной литературы.\n" +
        "\tВ разделе «Введение» указано наименование и краткая характеристика области применения программы «\(projectTopic)».\n" +
        "\tВ разделе «Основания для разработки» указан документ, на основании которого ведется разработка и наименование темы разработки.\n" +
        "\tВ разделе «Назначение разработки» указано функциональное и эксплуатационное назначение программного продукта.\n" +
        "\tРаздел «Требования к программе» содержит основные требования к функциональным характеристикам, к интерфейсу программы, к надежности, к условиям эксплуатации, к составу и параметрам технических средств, к информационной и программной совместимости, к маркировке и упаковке, к транспортировке и хранению.\n" +
        "\tРаздел «Требования к программной документации» содержит предварительный состав программной документации и специальные требования к ней.\n" +
        "\tРаздел «Технико-экономические показатели» содержит ориентировочную экономическую эффективность, предполагаемую годовую потребность, экономические преимущества разработки программы «\(projectTopic)».\n" +
        "\tРаздел «Стадии и этапы разработки» содержит этапы, содержание и сроки работ.\n" +
        "\tВ разделе «Порядок контроля и приемки» указаны общие требования к приемке работы.\n" +
        "\tНастоящий документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 [2] Виды программ и программных документов.\n" +
        "\t2.\tГОСТ 19.102-77 [3] Стадии разработки.\n" +
        "\t3.\tГОСТ 19.103-77 [4] Обозначения программ и программных документов.\n" +
        "\t4.\tГОСТ 19.104-78 [5] Основные надписи.\n" +
        "\t5.\tГОСТ 19.105-78 [6] Общие требования к программным документам.\n" +
        "\t6.\tГОСТ 19.106-78 [7] Требования к программным документам, выполненным печатным способом.\n" +
        "\t7.\tГОСТ  [] \n" +
        "\tИзменения к  оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78[15]."
    }
}
