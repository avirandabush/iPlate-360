//
//  MainVc+Camera.swift
//  plate360
//
//  Created by Aviran Dabush on 07/11/2025.
//

import UIKit
import Photos
import PhotosUI
import AVFoundation

extension MainVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    internal func presentImageSourceActionSheet() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "main.screen.camera.openCamera".localized, style: .default, handler: { [weak self] _ in
                self?.requestCameraAccessAndPresent()
            }))
        }
        
        alert.addAction(UIAlertAction(title: "main.screen.camera.openLibrary".localized, style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        alert.addAction(UIAlertAction(title: "cancel".localized, style: .cancel, handler: nil))
        
        if let popover = alert.popoverPresentationController, let view = self.view {
            popover.sourceView = view
            popover.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = []
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    private func requestCameraAccessAndPresent() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            presentCamera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    if granted {
                        self?.presentCamera()
                    } else {
                        self?.showCameraAccessDeniedAlert()
                    }
                }
            }
        case .denied, .restricted:
            showCameraAccessDeniedAlert()
        @unknown default:
            showCameraAccessDeniedAlert()
        }
    }
    
    private func showCameraAccessDeniedAlert() {
        let alert = UIAlertController(
            title: "main.camera.noCameraPermission".localized,
            message: "main.camera.pleaseAllowCameraAccessInSettings".localized,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "cancel".localized, style: .cancel))
        alert.addAction(UIAlertAction(title: "main.camera.openSettings".localized, style: .default, handler: { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        }))
        present(alert, animated: true)
    }
    
    private func presentCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            let alert = UIAlertController(title: nil, message: "main.camera.cameraIsNotAvaiable".localized, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok".localized, style: .default))
            present(alert, animated: true)
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        picker.delegate = self
        picker.allowsEditing = false
        present(picker, animated: true)
    }
    
    private func presentPhotoPicker() {
        if #available(iOS 14, *) {
            var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
            config.selectionLimit = 1
            config.filter = .images
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            present(picker, animated: true)
        } else {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            handlePickedImage(image)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        guard let item = results.first, item.itemProvider.canLoadObject(ofClass: UIImage.self) else { return }
        item.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (obj, error) in
            DispatchQueue.main.async {
                if let image = obj as? UIImage {
                    self?.handlePickedImage(image)
                } else {
                    print("Error: Cannot load image")
                }
            }
        }
    }
    
    private func handlePickedImage(_ image: UIImage) {
        print("picked image size: \(image.size)")
        
        loaderView.startLoading()
        
        let numberFromImage = processImageForOCR(from: image)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.loaderView.stopLoading()
            self?.searchField.text = numberFromImage
            self?.searchButton.isEnabled = true
        }
    }
    
    private func processImageForOCR(from image: UIImage) -> String {
        return "1741863"
    }
}
