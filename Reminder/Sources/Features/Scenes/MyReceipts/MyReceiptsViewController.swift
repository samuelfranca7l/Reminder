//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by Samuel França on 28/05/25.
//

import UIKit

class MyReceiptsViewController: UIViewController {
    let contentView: MyReceiptsView
    weak var flowDelegate: MyReceiptsFlowDelegate?
    
    private let mockMedicamentos = [
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "4 em 4 horas"),
        ("aspirina", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "8 em 8 horas"),
        ("Buscopam", "15:00", "2 em 2 horas"),
        ("dipirona", "13:00", "2 em 2 horas"),
    ]
    
    init(contentView: MyReceiptsView,
         flowDelegate: MyReceiptsFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        contentView.delegate = flowDelegate
        setup()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray600
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }
    
    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(RemedyCell.self, forCellReuseIdentifier: RemedyCell.identifier)
        contentView.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}


extension MyReceiptsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockMedicamentos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
}

extension MyReceiptsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RemedyCell.identifier, for: indexPath) as! RemedyCell
        let medicamento = mockMedicamentos[indexPath.section]
        cell.configure(title: medicamento.0, time: medicamento.1, recurrence: medicamento.2)
        return cell
    }
    
    
}
