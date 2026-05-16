if [[ -d /usr/share/vulkan/icd.d ]]; then
    export VK_ICD_DIR=/usr/share/vulkan/icd.d
else
    return
fi

if [[ -f "$VK_ICD_DIR/radeon_icd.json" ]]; then
    if [[ -z "$VK_DRIVER_FILES" ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/radeon_icd.json"
    elif ! [[ "$VK_DRIVER_FILES" =~ ^.*radeon_icd\.json.*$ ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/radeon_icd.json:$VK_DRIVER_FILES"
    fi
elif [[ -f "$VK_ICD_DIR/radeon_icd.x86_64.json" ]]; then
    if [[ -z "$VK_DRIVER_FILES" ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/radeon_icd.x86_64.json"
    elif     ! [[ "$VK_DRIVER_FILES" =~ ^.*radeon_icd\.x86_64\.json.*$ ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/radeon_icd.x86_64.json:$VK_DRIVER_FILES"
    fi
fi
if [[ -f "$VK_ICD_DIR/nvidia_icd.json" ]]; then
    if [[ -z "$VK_DRIVER_FILES" ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/nvidia_icd.json"
    elif ! [[ "$VK_DRIVER_FILES" =~ ^.*nvidia_icd\.json.*$ ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/nvidia_icd.json:$VK_DRIVER_FILES"
    fi
elif [[ -f "$VK_ICD_DIR/nvidia_icd.x86_64.json" ]]; then
    if [[ -z "$VK_DRIVER_FILES" ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/nvidia_icd.x86_64.json"
    elif ! [[ "$VK_DRIVER_FILES" =~ ^.*nvidia_icd\.x86_64\.json.*$ ]]; then
        VK_DRIVER_FILES="$VK_ICD_DIR/nvidia_icd.x86_64.json:$VK_DRIVER_FILES"
    fi
fi

export VK_DRIVER_FILES
