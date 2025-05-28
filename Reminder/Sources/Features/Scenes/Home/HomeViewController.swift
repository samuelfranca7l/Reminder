//
//  HomeViewController.swift
//  Reminder
//
//  Created by Samuel França on 15/05/25.
//

import UIKit

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    let contentView: HomeView
    let flowDelegate: HomeFlowDelegate
    
    init(contentView: HomeView,
         flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        self.viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setup()
        setupActionForMyReceipts()
        setupActionForNewReceipe()
        checkForExistingData()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(image: UIImage(named: "logoutIcon"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(logoutAction))
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray600
        contentView.delegate = self
        buildHierarchy()
    }
    
    private func  setupActionForMyReceipts() {
        contentView.myPrescriptionsButtons.tapAction = { [weak self] in
            self?.didTapMyPrescriptionButton()
            
        }
    }
    
    private func  setupActionForNewReceipe() {
        contentView.newPrescriptionButton.tapAction = { [weak self] in
            self?.didTapNewPrescriptionButton()
            
        }
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    @objc
    private func logoutAction(){
        UserDefaultsManager.removeUser()
        self.flowDelegate.logout()
    }
    
    private func checkForExistingData() {
        if UserDefaultsManager.loadUser() != nil {
            contentView.nameTextField.text = UserDefaultsManager.loadUserName()
        }
        if UserDefaultsManager.loadProfileImage() != nil {
            contentView.profileImage.image = UserDefaultsManager.loadProfileImage()
        }
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func didTapProfileImage() {
        selectProfileImage()
    }
    
    func didTapMyPrescriptionButton() {
        flowDelegate.navigateToRecipesList()
    }
    
    func didTapNewPrescriptionButton() {
        flowDelegate.navigateToNewRecipes()
    }

}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true)
        
    }
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            contentView.profileImage.image = editedImage
            UserDefaultsManager.saveProfileImage(image: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.profileImage.image = originalImage
            UserDefaultsManager.saveProfileImage(image: originalImage)

        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
